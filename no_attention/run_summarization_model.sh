#!/bin/bash


project_run=$(basename "$0")

#create log dir
mkdir log 

#submit job
qsub -cwd \
  -l gpu=1 \
  -e /home/joppew/titan/no_attention/log/$project_run.error \
  -o /home/joppew/titan/no_attention/log/$project_run.log \
  /home/joppew/titan/no_attention/docker/$project_run

