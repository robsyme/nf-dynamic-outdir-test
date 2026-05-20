#!/usr/bin/env nextflow

process MAKE_FILE {
    publishDir "results", mode: 'copy'

    output:
    path 'greeting.txt'

    script:
    """
    echo "Hello from run ${workflow.runName} at \$(date -u +%FT%TZ)" > greeting.txt
    """
}

workflow {
    MAKE_FILE()
}
