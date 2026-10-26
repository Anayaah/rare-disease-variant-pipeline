include { QC_CHECK } from './modules/qc.nf'
include { BASIC_STATS } from './modules/stats.nf'
include { INJECT_VAF } from './modules/vaf.nf'

params {
    input_vcf: String = "data/test/sample.vcf"
}

workflow {
    vcf_channel = channel.fromPath(params.input_vcf)
    QC_CHECK(vcf_channel)
    BASIC_STATS(vcf_channel)

    pct_channel = channel.of(10, 30, 50, 70)
    INJECT_VAF(vcf_channel.combine(pct_channel))
}
