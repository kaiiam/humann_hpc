# humann_hpc

Based on the original version available from https://github.com/biobakery/humann, and the concise [docs for installation](https://huttenhower.sph.harvard.edu/humann). Also see [Alise Ponsero's version](https://github.com/aponsero/Humann_annotation_HPC).

## Steps to Install Humann

Done on the University of Arizona HPC running linux with SLURM.

```
conda create --name humann_kai python=3.7

# Activate Environment
conda activate humann_kai

#Set conda channel priority:
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --add channels biobakery

#install pip
conda install pip

# install humann
pip install humann --no-binary :all:

# install metaphlan
conda install -c bioconda metaphlan
# fix libtbb2 for bowtie2
conda install tbb=2020.2
```

## Install databases

```
# install databases done in new folder database
mkdir database
cd database/

#install chocophlan
humann_databases --download chocophlan full .
humann_databases --download uniref uniref90_diamond .
humann_databases --download utility_mapping full .
```



## Run

Make sure to modify the list of samples in `config/config.yml` and or `config/list.txt`

From `/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/kai/humann_hpc`
```
sh submit_snakemake.sh #this isn't working try instead:
./run_array_job.sh
```


## Old

### Install snakemake

Originally tried using snakemake but went with a SLURM batch array instead.

```
source activate humann_kai #in case this wasn't called
conda install -c bioconda snakemake
```
