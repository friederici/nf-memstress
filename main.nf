#!/usr/bin/env nextflow
 
process memstress {
  debug true
  cpus 1
  memory '2 GB'
  pod = [ [env: 'env_memory', value: '500'], [env: 'env_time', value: '20'], [env: 'env_cores', value: '1'] ]

  """
  echo "memstress"
  /mem.sh
  """
}

workflow {
  memstress()
}

