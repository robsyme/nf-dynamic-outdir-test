# nf-dynamic-outdir-test

A one-process Nextflow pipeline used to test setting a dynamic per-run output base directory via the `NXF_FILE_ROOT` environment variable, without modifying the pipeline's `publishDir` definitions.

The pipeline uses Nextflow's workflow `output { }` block to publish `greeting.txt`. The output directory defaults to a *relative* `results/`. When `NXF_FILE_ROOT` is set, Nextflow resolves that relative path against it, so each run lands in its own subdirectory.

## Run locally

Default (publishes to `./results/greeting.txt`):

```bash
nextflow run .
```

With a dynamic base directory:

```bash
export NXF_FILE_ROOT=/tmp/outputs/run-$(date +%s)
nextflow run .
ls "$NXF_FILE_ROOT/results/"
```

## Run on Seqera Platform

Set this as the pre-run script in the launch form's advanced options so each launch lands in its own subdirectory keyed by the Platform-assigned workflow id:

```bash
export NXF_FILE_ROOT=s3://my-bucket/outputs/${TOWER_WORKFLOW_ID}
```

The pipeline itself stays untouched — modules keep their existing relative `publishDir` paths.
