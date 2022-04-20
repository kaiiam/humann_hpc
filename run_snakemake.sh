#!/bin/bash

#SBATCH --ntasks=2
#SBATCH --mem=10gb
#SBATCH --time=24:00:00

source ~/.bashrc
source activate humann_kai

#cd $SLURM_SUBMIT_DIR
cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/kai/humann_hpc

#rm results/interproscan.txt results/killed_interproscan.txt
#dry run
#snakemake -n

snakemake --unlock

echo 'snakemake --cluster "sbatch -A {cluster.group} -p {cluster.partition} -n {cluster.n} -t {cluster.time} -N {cluster.N} --mem={cluster.m} --ntasks={cluster.ntasks} --mem-per-cpu={cluster.mpc} -e {cluster.e} -o {cluster.o}"  --cluster-config config/cluster.yml -j 3 --latency-wait 30'

#run in cluster
snakemake --cluster "sbatch -A {cluster.group} -p {cluster.partition} -n {cluster.n} -t {cluster.time} -N {cluster.N} --mem={cluster.m} --ntasks={cluster.ntasks} --mem-per-cpu={cluster.mpc} -e {cluster.e} -o {cluster.o}"  --cluster-config config/cluster.yml -j 3 --latency-wait 30
