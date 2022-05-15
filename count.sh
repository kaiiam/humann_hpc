#!/bin/bash
################################################################################
# count.sh
# for gzipped reads
# usage
#   count.sh *.gz
################################################################################

for target in $*; do
    echo "$target"
    zcat $target |
        awk 'NR%4==2{c++; l+=length($0)}
        END{
            print "    Number of reads: "c;
            print "    Number of bases in reads: "l
        }'
done
