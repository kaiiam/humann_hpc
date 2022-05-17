#!/bin/bash

INPUT_DIR="../../heidi/karnes_metagenomes/"
$SMPLE="Karnes-10-1_UA-NGsp-fastq_Karnes-C11-U035_Karnes-C11_S285_R1_001.fastq.gz"

gunzip -c $INPUT_DIR/$SMPLE | head -n 10
