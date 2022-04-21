#!/bin/bash
#SBATCH --job-name=human_test
#SBATCH --account=karnes
#SBATCH --partition=standard
#SBATCH --time=72:00:00
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

# add bowtie2 use unpaired option

# add trimgalore use unpaired option

#run humann
humann --input $INPUT_DIR/$SMPLE --output test_results

# # Test run humann
# humann --input test/$SMPLE --output test_results
