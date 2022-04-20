#!/bin/bash

### Optional. Set the job name
#SBATCH --job-name=test_humann_env
### REQUIRED. Specify the PI group for this job
#SBATCH --account=bhurwitz
### REQUIRED. Set the partition for your job.
#SBATCH --partition=standard
### REQUIRED. Set the number of cores that will be used for this job.
#SBATCH --nodes=1
#SBATCH --ntasks=94
### REQUIRED. Set the memory required for this job.
#SBATCH --mem-per-cpu=5gb
### REQUIRED. Specify the time required for this job, hhh:mm:ss
#SBATCH --time=4:00:00

source activate humann_kai

humann -i test.fastq.gz -o test_results
