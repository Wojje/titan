#!/bin/bash

/home/joppew/titan/docker/docker_run_gpu.sh --rm -t -v /home/joppew/logs:/logs joppew/asudl:latest bash model_bbc/start_script.sh
