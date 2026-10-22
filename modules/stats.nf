process BASIC_STATS {
    container 'ubuntu:24.04'
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
