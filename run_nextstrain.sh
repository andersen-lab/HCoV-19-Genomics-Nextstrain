#!/bin/bash
#PBS -l walltime=120:00:00 -l nodes=1 -l mem=2gb -q gpu -o /gpfs/home/natem/logs/nextstrain.txt -j oe

cd /gpfs/home/natem/scripts/ncov
snakemake -k -j 50 --profile profiles/california/  --cluster-config config/cluster.json --cluster "qsub -V -l walltime={cluster.walltime} -l mem={cluster.mem} -l nodes={cluster.n} -q {cluster.queue} -o {cluster.logfile} -j {cluster.stdout}" results/usa_california/aa_muts.json results/usa_california_sandiego/aa_muts.json
