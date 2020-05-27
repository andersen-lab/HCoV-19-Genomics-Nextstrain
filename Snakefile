import os
from snakemake.utils import validate

configfile: "config/config.yaml"
validate( config, schema="schemas/config.schema.yaml" )

output_dir = config["out_dir"]

REGIONS = config["regions"].split( " " )

rule all:
    input:
        os.path.join( output_dir, "results/filtered.fasta" )
        #auspice_json = expand( os.path.join( output_dir, "auspice/ncov_{region}.json" ), region=REGIONS ),
        #tip_frequency = expand( os.path.join( output_dir, "auspice/ncov_{region}_tip-frequencies.json" ), region=REGIONS )

rule clean:
    message: "Removing directories: {params}"
    params:
        "results ",
        "auspice"
    shell:
        "rm -rfv {params}"

rule update:
    message: "Pull sequences from SEARCH repository, rename, and combine input"
    output:
        sequences = "data/sequences.fasta",
        metadata = "data/metadata.tsv"
    shell:
        "python3 scripts/combine_data.py --search data/ --gmetadata data/metadata_2020-05-27_16-12.tsv --gseqs data/sequences_2020-05-27_16-12.fasta"

rule filter:
    message:
        """
        Filtering input sequences to:
         - exclude strains in {input.exclude}
         - minimum genome length of {params.min_length}
        """
    input:
        sequences = rules.update.output.sequences,
        metadata = rules.update.output.metadata,
        include = config["files"]["include"],
        exclude = config["files"]["exclude"]
    output:
        sequences = os.path.join( output_dir, "results/filtered.fasta" )
    log:
        os.path.join( output_dir, "logs/filtered.txt" )
    params:
        min_length = config["filter"]["min_length"],
        exclude_where = config["filter"]["exclude_where"],
        group_by = config["filter"]["group_by"],
        sequences_per_group = config["filter"]["sequences_per_group"]
    shell:
        """
        augur filter \
            --sequences {input.sequences} \
            --metadata {input.metadata} \
            --include {input.include} \
            --exclude {input.exclude} \
            --exclude-where {params.exclude_where}\
            --min-length {params.min_length} \
            --group-by {params.group_by} \
            --sequences-per-group {params.sequences_per_group} \
            --output {output.sequences} 2>&1 | tee {log}
        """

checkpoint partition_sequences:
    input:
        sequences = rules.filter.output.sequences
    output:
        split_sequences = directory( os.path.join( output_dir, "results/split_sequences/" ) ) 
    log:
        os.path.join( output_dir, "logs/partition_sequences.txt" )
    params:
        sequences_per_group = config["partition_sequences"]["sequences_per_group"]
    shell:
        """
        python3 scripts/partition-sequences.py \
            --sequences {input.sequences} \
            --sequences-per-group {params.sequences_per_group} \
            --output-dir {output.split_sequences} 2>&1 | tee {log}
        """

rule align:
    message:
        """
        Aligning sequences to {input.reference}
          - gaps relative to reference are considered real
        Cluster:  {wildcards.cluster}
        """
    input:
        sequences = "results/split_sequences/{cluster}.fasta",
        reference = config["files"]["reference"]
    output:
        alignment = os.path.join( output_dir, "results/split_alignments/{cluster}.fasta" )
    threads: 2
    log:
        os.path.join( output_dir, "logs/align_{cluster}.txt" )
    shell:
        """
        augur align \
            --sequences {input.sequences} \
            --reference-sequence {input.reference} \
            --output {output.alignment} \
            --nthreads {threads} \
            --remove-reference 2>&1 | tee {log}
        """


def _get_alignments(wildcards):
    checkpoint_output = checkpoints.partition_sequences.get(**wildcards).output[0]
    return expand( os.path.join( output_dir, "results/split_alignments/{i}.fasta" ),
                  i=glob_wildcards(os.path.join(checkpoint_output, "{i}.fasta") ).i )


rule aggregate_alignments:
    message: "Collecting alignments"
    input:
        alignments = _get_alignments
    output:
        alignment = os.path.join( output_dir, "results/aligned.fasta" )
    log:
        os.path.join( output_dir, "logs/aggregate_alignments.txt" )
    shell:
        """
        cat {input.alignments} > {output.alignment} 2> {log}
        """


rule mask:
    message:
        """
        Mask bases in alignment
          - masking {params.mask_from_beginning} from beginning
          - masking {params.mask_from_end} from end
          - masking other sites: {params.mask_sites}
        """
    input:
        alignment = rules.align.output.alignment
    output:
        alignment = os.path.join( output_dir, "results/masked.fasta" )
    log:
        os.path.join( output_dir, "logs/mask.txt" )
    params:
        mask = config["mask"]["mask"]
    shell:
        """
        augur mask
            --sequences {input.alignment} \
            --mask {params.mask} \
            --output {output.alignment} 2>&1 | tee {log}
        """


def _get_subsampling_settings( wildcards ):
    subsampling_settings = config["subsampling"]
    
    if hasattr( wildcards, "subsample" ):
        return subsampling_settings[wildcards.subsample]
    else:
        return subsampling_settings



rule adjust_metadata_regions:
    message:
        """
        Adjusting metadata for build '{wildcards.region}'
        """
    input:
        metadata = rules.update.output.metadata
    output:
        metadata = os.path.join( output_dir, "results/{region}/metadata_adjusted.tsv" )
    log:
        os.path.join( output_dir, "logs/{region}.adjust_metadata_regions.txt" )
    shell:
        """
        {python:q} scripts/adjust_regional_meta.py \
            --region {wildcards.region:q} \
            --metadata {input.metadata} \
            --output {output.metadata} 2>&1 | tee {log}
        """


rule tree:
    message: "Building tree"
    input:
        alignment = rules.mask.output.alignment
    output:
        tree = os.path.join( output_dir, "results/{region}/tree_raw.nwk" )
    log:
        os.path.join( output_dir, "logs/{region}.tree.txt" )
    shell:
        """
        augur tree \
            --alignment {input.alignment} \
            --output {output.tree} \
            --nthreads {threads} 2>&1 | tee {log}
        """


rule refine:
    message:
        """
        Refining tree
          - estimate timetree
          - use {params.coalescent} coalescent timescale
          - estimate {params.date_inference} node dates
        """
    input:
        tree = rules.tree.output.tree,
        alignment = rules.mask.output.alignment,
        metadata = rules.update.output.metadata
    output:
        tree = os.path.join( output_dir, "results/{region}/tree.nwk" ),
        node_data = os.path.join( output_dir, "results/{region}/branch_lengths.json" )
    log:
        os.path.join( output_dir, "logs/{region}.refine.txt" )
    params:
        root = config["refine"]["root"],
        clock_rate = config["refine"]["clock_rate"],
        clock_std_dev = config["refine"]["clock_std_dev"],
        coalescent = config["refine"]["coalescent"],
        date_inference = config["refine"]["date_inference"],
        divergence_unit = config["refine"]["divergence_unit"],
        clock_filter_iqd = config["refine"]["clock_filter_iqd"]
    shell:
        """
        augur refine \
            --tree {input.tree} \
            --alignment {input.alignment} \
            --metadata {input.metadata} \
            --output-tree {output.tree} \
            --output-node-data {output.node_data} \
            --root {params.root} \
            --timetree \
            --clock-rate {params.clock_rate} \
            --clock-std-dev {params.clock_std_dev} \
            --coalescent {params.coalescent} \
            --date-inference {params.date_inference} \
            --divergence-unit {params.divergence_unit} \
            --date-confidence \
            --no-covariance \
            --clock-filter-iqd {params.clock_filter_iqd} 2>&1 | tee {log}
        """


rule ancestral:
    message:
        """
        Reconstructing ancestral sequences and mutations
          - inferring ambiguous mutations
        """
    input:
        tree = rules.refine.output.tree,
        alignment = rules.mask.output.alignment
    output:
        node_data = os.path.join( output_dir, "results/{region}/nt_muts.json" )
    log:
        os.path.join( output_dir, "logs/{region}.ancestral.txt" )
    params:
        inference = config["ancestral"]["inference"]
    shell:
        """
        augur ancestral \
            --tree {input.tree} \
            --alignment {input.alignment} \
            --output-node-data {output.node_data} \
            --inference {params.inference} \
            --infer-ambiguous 2>&1 | tee {log}
        """


rule haplotype_status:
    message: "Annotating haplotype status relative to {params.reference_node_name}"
    input:
        nt_muts = rules.ancestral.output.node_data
    output:
        node_data = os.path.join( output_dir, "results/{region}/haplotype_status.json" )
    log:
        os.path.join( output_dir, "logs/{region}.haplotype_status.txt" )
    params:
        reference_node_name = config["reference_node_name"]
    shell:
        """
        python3 scripts/annotate-haplotype-status.py \
            --ancestral-sequences {input.nt_muts} \
            --reference-node-name {params.reference_node_name:q} \
            --output {output.node_data} 2>&1 | tee {log}
        """


rule translate:
    message: "Translating amino acid sequences"
    input:
        tree = rules.refine.output.tree,
        node_data = rules.ancestral.output.node_data,
        reference = config["files"]["reference"]
    output:
        node_data = os.path.join( output_dir, "results/{region}/aa_muts.json" )
    log:
        os.path.join( output_dir, "logs/{region}.translate.txt" )
    shell:
        """
        augur translate \
            --tree {input.tree} \
            --ancestral-sequences {input.node_data} \
            --reference-sequence {input.reference} \
            --output-node-data {output.node_data} 2>&1 | tee {log}
        """


def _get_metadata_by_region( region ):
    if region == "global":
        return rules.update.output.metadata
    else:
        return rules.adjust_metadata_regions.output.metadata

def _get_exposure_trait_for_wildcards( wildcards ):
    if wildcards.region in config["exposure"]:
        return config["exposure"][wildcards.region]["trait"]
    else:
        return config["exposure"]["default"]["trait"]

rule traits:
    message:
        """
        Inferring ancestral traits for {params.columns!s}
          - increase uncertainty of reconstruction by {params.sampling_bias_correction} to partially account for sampling bias
        """
    input:
        tree = rules.refine.output.tree,
        metadata = _get_metadata_by_region
    output:
        node_data = os.path.join( output_dir, "results/{region}/traits.json" )
    log:
        os.path.join( output_dir, "logs/{region}.traits.txt" )
    params:
        columns = _get_exposure_trait_for_wildcards,
        sampling_bias_correction = config["traits"]["sampling_bias_correction"]
    shell:
        """
        augur traits \
            --tree {input.tree} \
            --metadata {input.metadata} \
            --output {output.node_data} \
            --columns {params.columns} \
            --confidence \
            --sampling-bias-correction {params.sampling_bias_correction} 2>&1 | tee {log}
        """

rule clades:
    message: "Adding internal clade labels"
    input:
        tree = rules.refine.output.tree,
        aa_muts = rules.translate.output.node_data,
        nuc_muts = rules.ancestral.output.node_data,
        clades = config["files"]["clades"]
    output:
        clade_data = os.path.join( output_dir, "results/{region}/clades.json" )
    log:
        os.path.join( output_dir, "logs/{region}.clades.txt" )
    shell:
        """
        augur clades --tree {input.tree} \
            --mutations {input.nuc_muts} {input.aa_muts} \
            --clades {input.clades} \
            --output-node-data {output.clade_data} 2>&1 | tee {log}
        """


rule colors:
    message: "Constructing colors file"
    input:
        ordering = config["files"]["ordering"],
        color_schemes = config["files"]["color_schemes"],
        metadata = _get_metadata_by_region
    output:
        colors = os.path.join( output_dir, "results/{region}/colors.tsv" )
    log:
        os.path.join( output_dir, "logs/{region}.colors.txt" )
    shell:
        """
        python3 scripts/assign-colors.py \
            --ordering {input.ordering} \
            --color-schemes {input.color_schemes} \
            --output {output.colors} \
            --metadata {input.metadata} 2>&1 | tee {log}
        """


rule recency:
    message: "Use metadata on submission date to construct submission recency field"
    input:
        metadata = _get_metadata_by_region
    output:
        os.path.join( output_dir, "results/{region}/recency.json" )
    log:
        os.path.join( output_dir, "logs/{region}.recency.txt" )
    shell:
        """
        python3 scripts/construct-recency-from-submission-date.py \
            --metadata {input.metadata} \
            --output {output} 2>&1 | tee {log}
        """


rule tip_frequencies:
    message: "Estimating censored KDE frequencies for tips"
    input:
        tree = rules.refine.output.tree,
        metadata = _get_metadata_by_region
    output:
        tip_frequencies_json = os.path.join( output_dir, "auspice/ncov_{region}_tip-frequencies.json" )
    log:
        os.path.join( output_dir, "logs/{region}.tip_frequencies.txt" )
    params:
        min_date = config["frequencies"]["min_date"],
        pivot_interval = config["frequencies"]["pivot_interval"],
        narrow_bandwidth = config["frequencies"]["narrow_bandwidth"],
        proportion_wide = config["frequencies"]["proportion_wide"]
    shell:
        """
        augur frequencies \
            --method kde \
            --metadata {input.metadata} \
            --tree {input.tree} \
            --min-date {params.min_date} \
            --pivot-interval {params.pivot_interval} \
            --narrow-bandwidth {params.narrow_bandwidth} \
            --proportion-wide {params.proportion_wide} \
            --output {output.tip_frequencies_json} 2>&1 | tee {log}
        """


rule export:
    message: "Exporting data files for for auspice"
    input:
        tree = rules.refine.output.tree,
        metadata = _get_metadata_by_region,
        branch_lengths = rules.refine.output.node_data,
        nt_muts = rules.ancestral.output.node_data,
        aa_muts = rules.translate.output.node_data,
        traits = rules.traits.output.node_data,
        auspice_config = config["files"]["auspice_config"],
        colors = rules.colors.output.colors,
        lat_longs = config["files"]["lat_longs"],
        description = config["files"]["description"],
        clades = rules.clades.output.clade_data,
        recency = rules.recency.output
    output:
        auspice_json = os.path.join( output_dir, "auspice/ncov_{region}.json" )
    log:
        os.path.join( output_dir, "logs/{region}.export.txt" )
    params:
        title = "Global epidemiology of novel coronavirus - SEARCH"
    shell:
        """
        augur export v2 \
            --tree {input.tree} \
            --metadata {input.metadata} \
            --node-data {input.branch_lengths} {input.nt_muts} {input.aa_muts} {input.traits} {input.clades} {input.recency} \
            --auspice-config {input.auspice_config} \
            --colors {input.colors} \
            --lat-longs {input.lat_longs} \
            --title {params.title:q} \
            --description {input.description} \
            --output {output.auspice_json} 2>&1 | tee {log}
        """
