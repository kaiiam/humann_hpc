#!/bin/bash
#SBATCH --job-name=human_test
#SBATCH --account=karnes
#SBATCH --partition=standard
#SBATCH --time=4:00:00
#SBATCH --ntasks=94
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=5gb

# load environment
source activate humann_kai

# echo for log
echo "job started"; hostname; date

# Get sample ID
export SMPLE=`head -n +${SLURM_ARRAY_TASK_ID} config/test_list.txt | tail -n 1`
echo $SMPLE

INPUT_DIR="test/"

# Step 1

mkdir bowtie/

# # add bowtie2 use unpaired option
# bowtie2 -p 8 -x database/GRCh38_noalt_as/GRCh38_noalt_as -U $INPUT_DIR/$SMPLE --un-gz bowtie/$SMPLE

# Step 2

mkdir trimgalore/

# add trimgalore using unpaired option
trim_galore -o trimgalore/$SMPLE --fastqc bowtie/$SMPLE

# Step 3

# # run humann
# humann --input $INPUT_DIR/$SMPLE --output test_results
