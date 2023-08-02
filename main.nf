#!/usr/bin/env nextflow
 
process memstress {
  debug true
  cpus 1
  memory '1 G'
  pod = [ [env: 'env_memory', value: '300'], [env: 'env_time', value: '20'], [env: 'env_cores', value: '1'] ]

  input:
    val STR

  """
  echo "memstress !{STR}"
  /mem.sh
  """
}

workflow {
  Channel.of(1..10) | memstress
}

