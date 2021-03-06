#!/usr/env/bin cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: Annotate a vg graph with bed
doc: Includes all genome paths

hints:
  DockerRequirement:
    dockerPull: quay.io/vgteam/vg:dev-v1.12.1-51-g28ef4e32-t258-run
  SoftwareRequirement:
    packages:
      vg:
        version: ["1.12.1"]
        specs: [ https://doi.org/10.1038/nbt.4227 ]
#  ResourceRequirement:
#    coresMin: 1  # default!

inputs:
  xg:
    type: File
    # format: edam:format_1929  # we need a IRI/URI for FASTA format
  bed:
    type: File
    format: edam:format_3003
baseCommand: [ vg, annotate ]

arguments:
  - prefix: --xg-name
    valueFrom: $(inputs.xg.path)
  - prefix: --bed-name
    valueFrom: $(inputs.bed.path)
  - prefix: --threads
    valueFrom: $(runtime.cores)

stdout: $(inputs.xg.nameroot).gam

outputs:
  gam: stdout
  # same as
  # genome_graph:
  #   type: File
  #   outputBinding:
  #     glob: $(inputs.reference_genome.nameroot)_$(inputs.genomic_varients.nameroot).vg

$namespaces:
  edam: http://edamontology.org/
