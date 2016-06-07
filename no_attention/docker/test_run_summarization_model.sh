#!/bin/bash

/home/joppew/titan/docker/docker_run_gpu.sh --rm -t -v /home/joppew/test_logs:/test_logs joppew/asudl:latest-dropout bash /model/test_start_script.sh
