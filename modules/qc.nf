process QC_CHECK {
    publishDir "results/qc", mode: 'copy'

    input:
    path vcf_file

    output:
    path "qc_report.txt"

    script:
    """
    echo "QC Report for \$(basename $vcf_file)" > qc_report.txt
    echo "Line count: \$(wc -l < $vcf_file)" >> qc_report.txt
    echo "Variant count: \$(grep -vc '^#' $vcf_file)" >> qc_report.txt
    """
}
