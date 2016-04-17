#!/bin/bash

/home/joppew/titan/docker/docker_run_gpu.sh --rm -t -v /home/joppew/logs_dropout:/logs joppew/asudl:latest-dropout bash /model/start_script.sh
