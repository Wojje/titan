#!/bin/bash
CUDA_VISIBLE_DEVICES=0 python /home/joppew/model_dailymail/summarize.py --data_dir=/home/joppew/data_dailymail/ --logs_dir=/home/joppew/logs_no_dropout_sgd/ --train_dir=/home/joppew/logs_no_dropout_sgd/ --vocab_size=30000 --size=1 --num_layers=1 --batch_size=1 --steps_per_checkpoint=500 --steps_per_scheduled_job=500 &
FIRSTPID=${!};
CUDA_VISIBLE_DEVICES=1 CUDA_VISIBLE_DEVICES=0 python /home/joppew/model_dailymail/summarize.py --data_dir=/home/joppew/data_dailymail/ --logs_dir=/home/joppew/logs_dropout_sgd/ --train_dir=/home/joppew/logs_dropout_sgd/ --vocab_size=30000 --dropout_keep_prob=0.5 --size=1 --num_layers=1 --batch_size=1 --steps_per_checkpoint=500 --steps_per_scheduled_job=500 &
SECONDPID=${!};
CUDA_VISIBLE_DEVICES=2 python /home/joppew/model_dailymail/summarize.py --data_dir=/home/joppew/data_dailymail/ --logs_dir=/home/joppew/logs_no_dropout_adadelta/ --train_dir=/home/joppew/logs_no_dropout_adadelta/ --vocab_size=30000 --use_adadelta=True --size=1 --num_layers=1 --batch_size=1 --steps_per_checkpoint=500 --steps_per_scheduled_job=500 &
THIRDPID=${!};
CUDA_VISIBLE_DEVICES=3 python /home/joppew/model_dailymail/summarize.py --data_dir=/home/joppew/data_dailymail/ --logs_dir=/home/joppew/logs_dropout_adadelta/ --train_dir=/home/joppew/logs_dropout_adadelta/ --vocab_size=30000 --dropout_keep_prob=0.5 --use_adadelta=True --size=1 --num_layers=1 --batch_size=1 --steps_per_checkpoint=500 --steps_per_scheduled_job=500 &
FOURTHPID=${!};
wait $FIRSTPID $SECONDPID $THIRDPID $FOURTHPID

bash /home/joppew/titan/run_summarization_model.sh &

