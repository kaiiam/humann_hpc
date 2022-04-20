configfile: "config/config.yml"
threads_small=config["snakemake"]["threads_small"]
mem_small=config["snakemake"]["mem_small"]
threads_big=config["snakemake"]["threads_big"]
mem_big=config["snakemake"]["mem_big"]

rule all:
    input:
        expand("test/{sample}.fastq.gz", sample=config["samples"])

rule humann:
    input:
        #file=expand("test/{sample}.fastq.gz", sample=config["samples"])
        "test/{sample}.fastq.gz"
    output:
        "test/snakemake_test"
    threads: 1
    shell:
        """
        humann -i {input.file} -o {output}
        """
