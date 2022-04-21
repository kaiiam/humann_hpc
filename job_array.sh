#!/bin/bash
#SBATCH --job-name=human_test
#SBATCH --account=bhurwitz
#SBATCH --partition=standard
#SBATCH --time=1:00:00
#SBATCH --ntasks=94
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=5gb

# load environment
source activate humann_kai

# echo for log
echo "job started"; hostname; date

# Get sample ID
export SMPLE=`head -n +${SLURM_ARRAY_TASK_ID} config/list.txt | tail -n 1`
echo $SMPLE

INPUT_DIR=../../heidi/karnes_metagenomes/

run humann
humann --input $INPUT_DIR/$SMPLE --output results

# # Test run humann
# humann --input test/$SMPLE --output test_results
