#!/bin/bash

/home/joppew/titan/docker/docker_run_gpu.sh --rm -t -v /home/joppew/logs_dropout:/logs_dropout joppew/asudl:latest bash /model/start_script.sh
