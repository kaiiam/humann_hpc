# load environment
source activate humann_kai

IN_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/kai/humann_hpc/results_60_million/humann_results"

OUT_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/kai/humann_hpc/results_60_million/humann_results/cpm_norm_path"

cd $IN_DIR
mkdir $OUT_DIR

# merge table and stratify

mkdir result_tables
humann_join_tables --input $OUT_DIR --output humann_pathabundance.tsv --file_name cpm_Karnes
humann_split_stratified_table --input humann_pathabundance.tsv --output result_tables
mv humann_pathabundance.tsv result_tables


OUT_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/kai/humann_hpc/results_60_million/humann_results/cpm_norm_KO"


cd $IN_DIR
mkdir $OUT_DIR

# normalize gene abundance and group by KEGG
for f in *_genefamilies.tsv
do
    Kf="${f%%.tsv}KEGG.tsv"
    humann_regroup_table --input $f --groups uniref90_ko --output $Kf
    humann_renorm_table --input $Kf --output cpm_$Kf --units cpm
    mv cpm_$Kf $OUT_DIR
done

# merge table and stratify

humann_join_tables --input $OUT_DIR --output humann_KOabundance.tsv --file_name cpm_Karnes
humann_split_stratified_table --input humann_KOabundance.tsv --output result_tables
mv humann_KOabundance.tsv result_tables

# all without norm
humann_join_tables --input . --output humann_KOnonnorm.tsv --file_name _genefamiliesKEGG.tsv
humann_split_stratified_table --input humann_KOnonnorm.tsv --output result_tables_nonnorm
mv humann_KOnonnorm.tsv result_tables_nonnorm
