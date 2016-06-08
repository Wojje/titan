#!/bin/bash
/home/joppew/titan/attention/docker/docker_run_gpu.sh -e "CUDA_VISIBLE_DEVICES="`echo $CUDA_VISIBLE_DEVICES` --name="${USER}_att" --rm -t -v /home/joppew/logs_attention_dropout_256_3:/logs joppew/asudl:latest bash /model/model_attention/start_script.sh --data_dir=/data/ --logs_dir=/logs/ --train_dir=/logs/ --size=256 --num_layers=3 --batch_size=64 --dropout_keep_prob=0.5 --vocab_size=30000 --steps_per_checkpoint=1000 --steps_per_scheduled_job=1000

bash /home/joppew/titan/attention/run_summarization_model.sh
