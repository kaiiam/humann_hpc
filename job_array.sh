#!/bin/bash
#SBATCH --job-name=human_test
#SBATCH --account=bhurwitz
#SBATCH --partition=standard
#SBATCH --time=2:00:00
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

INPUT_DIR="../../heidi/karnes_metagenomes/"

# Step 1
## subsamples files
mkdir subsample/

gunzip -c $INPUT_DIR/$SMPLE | head -n 1000 | gzip > subsample/$SMPLE

# Step 2
mkdir bowtie/

# add bowtie2 use unpaired option
bowtie2 -p 8 -x database/GRCh38_noalt_as/GRCh38_noalt_as -U subsample/$SMPLE --un-gz bowtie/$SMPLE

# Step 3

mkdir trimgalore/

# add trimgalore using unpaired option
trim_galore -o trimgalore/$SMPLE --fastqc bowtie/$SMPLE

# Step 4

# run humann
humann --input trimgalore/$SMPLE/*_trimmed.fq.gz --output humann_results
