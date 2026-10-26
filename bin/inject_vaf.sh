#!/bin/bash
# Usage: inject_vaf.sh input.vcf VAF_PERCENT
set -euo pipefail
in="$1"
pct="$2"
af=$(awk -v p="$pct" 'BEGIN { printf "%.2f", p/100 }')
awk -v af="$af" 'BEGIN { FS = OFS = "\t" }
/^##/ { print; next }
/^#CHROM/ {
  print "##FORMAT=<ID=GT,Number=1,Type=String,Description=\"Genotype\">"
  print "##FORMAT=<ID=AF,Number=A,Type=Float,Description=\"Alternate allele fraction\">"
  print $0, "FORMAT", "SAMPLE"
  next
}
{
  v = ($2 == 3243) ? af : "1.00"
  gt = (v + 0 >= 0.95) ? "1/1" : "0/1"
  print $0, "GT:AF", gt ":" v
}' "$in" > "vaf_${pct}.vcf"
