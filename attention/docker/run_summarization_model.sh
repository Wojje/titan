#!/bin/bash
#CUDA_VISIBLE_DEVICES=1 
/home/joppew/titan/docker/docker_run_gpu.sh -e "CUDA_VISIBLE_DEVICES="`echo $CUDA_VISIBLE_DEVICES` --name="${USER}_att" --rm -t -v /home/joppew/logs_attention_dropout_256_3:/logs joppew/asudl:latest bash /model/model_attention/start_script.sh --data_dir=/data/ --logs_dir=/logs/ --train_dir=/logs/ --size=256 --num_layers=3 --batch_size=64 --dropout_keep_prob=0.5 --vocab_size=30000 --steps_per_checkpoint=1000 --steps_per_scheduled_job=1000
#FIRSTPID=${!};
#CUDA_VISIBLE_DEVICES=2 /home/joppew/titan/docker/docker_run_gpu.sh --name="${USER}2" --rm -t -v /home/joppew/logs_no_attention_dropout_256_3:/logs joppew/asudl:latest bash /model/start_script.sh --data_dir=/data/ --logs_dir=/logs/ --train_dir=/logs/ --size=256 --num_layers=3 --batch_size=64 --dropout_keep_prob=0.5 --vocab_size=30000 --steps_per_checkpoint=500 --steps_per_scheduled_job=500 & SECONDPID=${!};

#wait $FIRSTPID $SECONDPID

#CUDA_VISIBLE_DEVICES=0 /home/joppew/titan/docker/docker_run_gpu.sh --name="${USER}0" --rm -t -v /home/joppew/logs_no_dropout_500_2:/logs joppew/asudl:latest bash /model/start_script.sh --data_dir=/data/ --logs_dir=/logs/ --train_dir=/logs/ --size=1 --num_layers=1 --batch_size=64 --vocab_size=30000 --steps_per_checkpoint=100 --steps_per_scheduled_job=500 &
#FIRSTPID=${!};
#CUDA_VISIBLE_DEVICES=1 /home/joppew/titan/docker/docker_run_gpu.sh --name="${USER}1" --rm -t -v /home/joppew/logs_dropout_1000_1:/logs joppew/asudl:latest bash /model/start_script.sh --data_dir=/data/ --logs_dir=/logs/ --train_dir=/logs/ --size=1000 --num_layers=1 --batch_size=64 --dropout_keep_prob=0.5 --vocab_size=30000 --steps_per_checkpoint=1000 --steps_per_scheduled_job=1000 &
#SECONDPID=${!};
#CUDA_VISIBLE_DEVICES=2 /home/joppew/titan/docker/docker_run_gpu.sh --name="${USER}2" --rm -t -v /home/joppew/logs_no_dropout_1000_1:/logs joppew/asudl:latest bash /model/start_script.sh --data_dir=/data/ --logs_dir=/logs/ --train_dir=/logs/ --size=1 --num_layers=1 --batch_size=64 --vocab_size=30000 --steps_per_checkpoint=100 --steps_per_scheduled_job=500 &
#THIRDPID=${!};
#CUDA_VISIBLE_DEVICES=3 /home/joppew/titan/docker/docker_run_gpu.sh --name="${USER}3" --rm -t -v /home/joppew/logs_dropout_500_2:/logs joppew/asudl:latest bash /model/start_script.sh --data_dir=/data/ --logs_dir=/logs/ --train_dir=/logs/ --vocab_size=30000 --dropout_keep_prob=0.5 --size=1 --num_layers=1 --batch_size=64 --steps_per_checkpoint=100 --steps_per_scheduled_job=500 &
#FOURTHPID=${!};
#wait $FIRSTPID $SECONDPID #$THIRDPID $FOURTHPID
