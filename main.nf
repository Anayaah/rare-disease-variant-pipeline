include { QC_CHECK } from './modules/qc.nf'
include { BASIC_STATS } from './modules/stats.nf'

params {
    input_vcf: String = "data/test/sample.vcf"
}

workflow {
    vcf_channel = channel.fromPath(params.input_vcf)
    QC_CHECK(vcf_channel)
    BASIC_STATS(vcf_channel)
}
