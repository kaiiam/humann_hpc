# humann_hpc


## Steps to Intall Humann

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
