#!/bin/bash -l

#
#makes sure sample file is in the right place
#
if [[ ! -f "config/list.txt" ]]; then
    echo "input list does not exist. Please provide the path for a metagenome list. Job terminated."
    exit 1
fi

# get number of samples to process
export NUM_JOB=$(wc -l < "config/test_list.txt")

# submit co_assemblies
echo "launching scripts/job_array_test.sh as a job."

JOB_ID=`sbatch --job-name humann -a 1-$NUM_JOB test_job_array.sh`
