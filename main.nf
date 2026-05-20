#!/usr/bin/env nextflow

process MAKE_FILE {
    output:
    path 'greeting.txt'

    script:
    """
    echo "Hello from run ${workflow.runName} at \$(date -u +%FT%TZ)" > greeting.txt
    """
}

workflow {
    main:
    ch_greeting = MAKE_FILE()

    publish:
    greeting = ch_greeting
}

output {
    greeting {
        path '.'
    }
}
