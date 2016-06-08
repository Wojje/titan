#!/bin/bash


project_run=$(basename "$0")

#create log dir
mkdir log 

#submit job
qsub -cwd \
  -l gpu=1 \
  -e /home/joppew/titan/attention/log/$project_run.error \
  -o /home/joppew/titan/attention/log/$project_run.log \
  /home/joppew/titan/attention/docker/$project_run

