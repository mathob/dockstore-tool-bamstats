#!/usr/bin/env nextflow

bamFile = file(params.bam_input)

process bamstats {
    input:
    file bam_input

    output:
    file 'bamstats_report.zip'

    script:
    """
    bash /usr/local/bin/bamstats 4 $bam_input
    """
}


workflow {
    Channel.fromPath(params.bam_input) | bamstats
}