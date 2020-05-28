import pandas as pd
from Bio import SeqIO
import country_converter as coco
import os
from fnmatch import fnmatch
import argparse
import unicodedata

used_names = list()
count = 1

def get_SEARCH_name( entry, dedup=False ):
    name = list()
    name.append( entry["country"] )
    locations = entry[["division","location"]].to_list()
    locations = [str(i) for i in locations] 
    if "nan" in locations: locations.remove( "nan" )
    if "?" in locations: locations.remove( "?" )
    locations = [i.replace( " ", "" ) for i in locations]
    locations = [i.replace( "'", "" ) for i in locations]
    name.append( "-".join( locations ) )
    name.append( entry["accession"] )
    name.append( str( entry["date"] ) )
    new_name = "/".join( name )
    
    if dedup:
        if new_name in used_names:
            print( "{} already used".format( new_name ) )
            return "bad_name"
        used_names.append( new_name )

    return new_name

if __name__ == "__main__":
    
    parser = argparse.ArgumentParser( 
            description="Combine metadata and sequences from SEARCH repository and GISAID",
            formatter_class= argparse.ArgumentDefaultsHelpFormatter
    )
    
    parser.add_argument( "--search", type=str, required=True, help="SEARCH repository" )
    parser.add_argument( "--gseqs", type=str, required=True, help="GISAID sequences" )
    parser.add_argument( "--gmetadata", type=str, required=True, help="GISAID metadata" )

    args = parser.parse_args()
    

    gisaid_md = pd.read_csv( args.gmetadata, delimiter="\t" )
    gisaid_md["accession"] = gisaid_md["genbank_accession"]
    gisaid_md.loc[gisaid_md["genbank_accession"]=="?","accession"] = gisaid_md["strain"].apply( lambda x : x.replace( "/", "" ) ) 
    gisaid_md["country"] = coco.convert( names=gisaid_md["country"].to_list(), to="ISO3" )
    gisaid_md["name"] = gisaid_md["strain"]
    gisaid_md = gisaid_md.fillna( "?" ) 
    # Remove non-ascii characters where present.
    for i in gisaid_md.columns:
        try:
            gisaid_md[i] = gisaid_md[i].apply( lambda val: unicodedata.normalize( 'NFKD', val ).encode( 'ascii', 'ignore' ).decode() )
        except TypeError:
            continue

    gisaid_md["strain"] = gisaid_md.apply( get_SEARCH_name, axis=1, dedup=True )

    gisaid_md["strain"] = gisaid_md["strain"].apply(lambda val: unicodedata.normalize('NFKD', val).encode('ascii', 'ignore').decode())

    # Reorder according to nextstrain order
    gisaid_md = gisaid_md[["strain", 
               "virus", 
               "gisaid_epi_isl", 
               "genbank_accession", 
               "date", 
               "region", 
               "country", 
               "division", 
               "location", 
               "region_exposure", 
               "country_exposure", 
               "division_exposure", 
               "segment", 
               "length", 
               "host", 
               "age", 
               "sex", 
               "originating_lab", 
               "submitting_lab", 
               "authors", 
               "url", 
               "title", 
               "date_submitted",
               "name"]]

    gisaid_md = gisaid_md.set_index( "name" )

    search_md = pd.read_csv( os.path.join( args.search, "metadata.csv" ), encoding="ascii" )

    # Determine Country, division, and location
    search_md[["country","division", "location"]] = search_md["location"].str.split( "/", expand=True )

    # cleanup location
    search_md.loc[search_md["location"].isnull(),"location"] = "?"
    search_md["location"] = search_md["location"].str.replace( " ", "" )

    # cleanup country
    search_md["country"] = coco.convert( names=search_md["country"].to_list(), to="ISO3" )

    # Determine Region
    search_md["region"] = "North America"
    search_md.loc[search_md["country"]=="JOR","region"] = "Asia"

    search_md = search_md.rename(columns={"ID":"accession", 
                                          "collection_date": "date", 
                                          "gb_accession" : "genbank_accession", 
                                          "gisaid_accession" : "gisaid_epi_isl" } )
    search_md["strain"] = search_md.apply( get_SEARCH_name, axis=1 )

    search_md = search_md.set_index( "accession" ) 

    # Add missing data
    search_md["virus"] = "ncov"
    search_md["region_exposure"] = search_md["region"]
    search_md["country_exposure"] = search_md["country"]
    search_md["division_exposure"] = search_md["division"] 
    search_md["segment"] = "genome"
    search_md["host"] = "Human"
    search_md["age"] = "?"
    search_md["sex"] = "?"
    search_md["submitting_lab"] = "Andersen lab at Scripps Research"
    search_md["url"] = "https://github.com/andersen-lab/HCoV-19-Genomics"
    search_md["title"] = "?"
    search_md["date_submitted"] = search_md["date"]

    # We'll initialize this later
    search_md["length"] = 0

    #Rename columns and reorder according to GISAID 
    search_md = search_md[["strain", 
               "virus", 
               "gisaid_epi_isl", 
               "genbank_accession", 
               "date", 
               "region", 
               "country", 
               "division", 
               "location", 
               "region_exposure", 
               "country_exposure", 
               "division_exposure", 
               "segment", 
               "length", 
               "host", 
               "age", 
               "sex", 
               "originating_lab", 
               "submitting_lab", 
               "authors", 
               "url", 
               "title", 
               "date_submitted"]]

    search_md = search_md.fillna( "?" )

    search_location = os.path.join( args.search, "consensus_sequences" )
    files = [i for i in os.listdir(search_location) if fnmatch( i, "*.fa" )]

    search_seqs = list()
    search_ids = list()
    with open( "config/include.txt", "w" ) as include:
        for file in files:
            name = str( file.split( "." )[0] )
            seq = SeqIO.read( os.path.join( search_location, file ), "fasta" )
            seq.id = search_md.loc[name,"strain"]
            search_ids.append( search_md.loc[name,"gisaid_epi_isl"] )
            seq.description = ""
            seq.name = ""
            search_seqs.append( seq )

            search_md.loc[name,"length"] = len( seq.seq )

            if "unknown" not in search_md.loc[name,"strain"]:
                include.write( search_md.loc[name,"strain"] + "\n" )

    gisaid_seqs = list( SeqIO.parse( args.gseqs, "fasta" ) )

    append_md = list()

    count = 0 
    for seq in gisaid_seqs:

        try:
            ent = gisaid_md.loc[seq.name]
        except KeyError:
            print( "Unable to find: {}".format( seq.name ) )
            continue

        if ent["strain"] == "bad_name":
            count += 1
            continue

        if ent["gisaid_epi_isl"] in search_ids:
            count += 1
            continue

        seq.id = ent["strain"]
        seq.description = ""
        seq.name = ""

        search_seqs.append( seq )

        append_md.append( ent )

    append_md = pd.concat( append_md, axis=1 ).T.reset_index( drop=True )
    print( "{} sequences already in dataset.".format( count ) ) 

    combined_md = pd.concat( [search_md.reset_index( drop=True ), append_md], ignore_index=True )
    combined_md.to_csv( os.path.join( args.search, "metadata.tsv" ), index=False, sep="\t", encoding="ascii" )

    SeqIO.write( search_seqs, os.path.join( args.search, "sequences.fasta" ), "fasta" )

