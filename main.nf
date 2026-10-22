params {
    input_vcf: String = "data/test/sample.vcf"
}

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

process BASIC_STATS {
    publishDir "results/stats", mode: 'copy'

    input:
    path vcf_file

    output:
    path "stats_summary.txt"

    script:
    """
    echo "Basic VCF Stats" > stats_summary.txt
    echo "================" >> stats_summary.txt
    grep -v '^#' $vcf_file | awk '{print \$1}' | sort | uniq -c >> stats_summary.txt
    """
}

workflow {
    vcf_channel = channel.fromPath(params.input_vcf)
    QC_CHECK(vcf_channel)
    BASIC_STATS(vcf_channel)
}
