# Rare Disease Variant Prioritisation Pipeline

A Nextflow pipeline for detecting and prioritising pathogenic variants in
mitochondrial disease, built around the MELAS syndrome variant m.3243A>G.

**Status:** In progress 

## Goal
Most beginner variant-calling pipelines stop at frequency + consequence
filtering on a single sample. This project goes further by simulating
heteroplasmy (the mixture of mutant and healthy mitochondrial DNA within
one person) at multiple levels, and measuring how detection sensitivity
changes as that mixture ratio shifts.

## Planned pipeline
1. QC on input VCF
2. Variant annotation (VEP)
3. Population frequency filtering (gnomAD)
4. Known-pathogenicity filtering (MITOMAP / ClinVar)
5. Heteroplasmy sensitivity simulation (10/30/50/70% mutant fraction)
6. Phenotype-aware prioritisation (HPO + PanelApp gene list)
7. HTML/CSV report generation

## Tech stack
Nextflow · Docker · Python · VEP · gnomAD · MITOMAP · HPO · PanelApp

## Progress log
- [x] Dev environment set up (WSL2, Docker, Java, Nextflow)
- [ ] Week 1: pipeline skeleton (QC -> stats)
- [ ] Week 2: VEP annotation module, containerised
- [ ] Week 3: filtering + heteroplasmy simulation
- [ ] Week 4: HPO prioritisation, nf-test suite, final report
