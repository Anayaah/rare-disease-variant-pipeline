process INJECT_VAF {
    container 'ubuntu:24.04'
    publishDir "results/vaf", mode: 'copy'

    input:
    tuple path(vcf_file), val(pct)

    output:
    path "vaf_${pct}.vcf"

    script:
    """
    inject_vaf.sh $vcf_file $pct
    """
}
