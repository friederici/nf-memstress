#!/usr/bin/env nextflow
 
process memstress {
  debug true
  cpus 1
  memory '2 GB'
  pod = [ [env: 'env_memory', value: '300'], [env: 'env_time', value: '20'], [env: 'env_cores', value: '1'] ]

  """
  echo "memstress !{str}"
  /mem.sh
  """
}

workflow {
  Channel.of('1', '2', '3', '4', '5') | memstress
}

