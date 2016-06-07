#!/bin/bash


project_run=$(basename "$0")

#create log dir
mkdir log 

#submit job
qsub -cwd \
  -l gpu=1 \
  -e ./log/$project_run.error \
  -o ./log/$project_run.log \
  ./docker/$project_run

