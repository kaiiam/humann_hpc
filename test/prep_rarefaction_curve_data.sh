#!/bin/bash
#SBATCH --job-name=prep_rarefaction_data
#SBATCH --account=bhurwitz
#SBATCH --partition=standard
#SBATCH --time=72:00:00
#SBATCH --nodes=1

# 5 Million
gunzip -c  ../../../heidi/karnes_metagenomes/Karnes-10-1_UA-NGsp-fastq_Karnes-C11-U035_Karnes-C11_S285_R1_001.fastq.gz | head -n 20000000 | gzip > sample1_5M.fastq.gz

# 10 Million
gunzip -c  ../../../heidi/karnes_metagenomes/Karnes-10-1_UA-NGsp-fastq_Karnes-C11-U035_Karnes-C11_S285_R1_001.fastq.gz | head -n 40000000 | gzip > sample1_10M.fastq.gz

# 15 Million
gunzip -c  ../../../heidi/karnes_metagenomes/Karnes-10-1_UA-NGsp-fastq_Karnes-C11-U035_Karnes-C11_S285_R1_001.fastq.gz | head -n 60000000 | gzip > sample1_15M.fastq.gz

# 20 Million
gunzip -c  ../../../heidi/karnes_metagenomes/Karnes-10-1_UA-NGsp-fastq_Karnes-C11-U035_Karnes-C11_S285_R1_001.fastq.gz | head -n 80000000 | gzip > sample1_20M.fastq.gz

# 30 Million
gunzip -c  ../../../heidi/karnes_metagenomes/Karnes-10-1_UA-NGsp-fastq_Karnes-C11-U035_Karnes-C11_S285_R1_001.fastq.gz | head -n 120000000 | gzip > sample1_30M.fastq.gz

# 40 Million
gunzip -c  ../../../heidi/karnes_metagenomes/Karnes-10-1_UA-NGsp-fastq_Karnes-C11-U035_Karnes-C11_S285_R1_001.fastq.gz | head -n 160000000 | gzip > sample1_40M.fastq.gz

# 60 Million
gunzip -c  ../../../heidi/karnes_metagenomes/Karnes-10-1_UA-NGsp-fastq_Karnes-C11-U035_Karnes-C11_S285_R1_001.fastq.gz | head -n 240000000 | gzip > sample1_60M.fastq.gz
