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

# install bowtie2 #might not need this
conda install -c bioconda bowtie2

# install trim-galore
conda install -c bioconda trim-galore

```

## Install databases

```
# install databases done in new folder database
mkdir database
cd database/

#install humann databases: chocophlan uniref and human util
humann_databases --download chocophlan full .
humann_databases --download uniref uniref90_diamond .
humann_databases --download utility_mapping full .

#Download Human genome for bowtie2
wget https://genome-idx.s3.amazonaws.com/bt/GRCh38_noalt_as.zip
unzip GRCh38_noalt_as.zip

```



## Run

Make sure to modify the list of samples in `config/list.txt`

From `/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/kai/humann_hpc`
```
sh submit_snakemake.sh #this isn't working try instead:
./run_array_job.sh

Run for rarefaction curve:
./test_run_array_job.sh
```


## Pipeline summary

pipeline will be step 1) [bowtie2](https://github.com/BenLangmead/bowtie2) to remove human contamination step 2) [TrimGalore](https://github.com/FelixKrueger/TrimGalore) to do quality control (e.g. removing low quality reads and trimming adaptors) step 3) [humann](https://github.com/biobakery/humann) to get functional annotations using UNIREF90 which we’ll map to COG and taxonomic annotations using metaphlan

## Old

### Install snakemake

Originally tried using snakemake but went with a SLURM batch array instead.

```
source activate humann_kai #in case this wasn't called
conda install -c bioconda snakemake
```
