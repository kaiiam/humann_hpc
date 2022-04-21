#!/bin/bash
#SBATCH --job-name=human_test
#SBATCH --account=bhurwitz
#SBATCH --output=errout/outputr%j.txt
#SBATCH --error=errout/errors_%j.txt
#SBATCH --partition=standard
#SBATCH --time=1:00:00
#SBATCH --ntasks=20
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=5gb

# load environment
source activate humann_kai

# echo for log
echo "job started"; hostname; date

# Get sample ID
export SMPLE=`head -n +${SLURM_ARRAY_TASK_ID} config/list.txt | tail -n 1`
echo $SMPLE

#run humann
humann --input input/$SMPLE --output results
