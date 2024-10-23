#!/bin/bash
NUM_FRAME=49
HEIGHT=480
WIDTH=720
LEARNING_RATE=1e-6
LOSS_TYPE="huber"
REWARD_SCALE=1.0

MODEL_DIR=THUDM/CogVideoX-2b
MODEL_DIR2=THUDM/CogVideoX-2b
OUTPUT_DIR=/lustre/scratch/users/hao.zhang/rlsu_files/ckptfolder/cogvid_2b_turbo/$LOSS_TYPE/$LEARNING_RATE/$REWARD_SCALE
# VAE_DIR=/home/ubuntu/document/data/Open-Sora-Plan-v1.2.0/vae


accelerate launch --main_process_port 29506 --num_processes 4 ./cog_turbo_new.py \
  --pretrained_teacher_model=$MODEL_DIR \
  --pretrained_student_model=$MODEL_DIR2 \
  --num_frames=$NUM_FRAME \
  --height=$HEIGHT \
  --width=$WIDTH \
  --output_dir=$OUTPUT_DIR \
  --cache_dir="/lustre/scratch/users/hao.zhang/.cache" \
  --num_train_inferences=8 \
  --lr_scheduler="constant" \
  --mixed_precision=fp16 \
  --resolution=1024 \
  --learning_rate=$LEARNING_RATE \
  --train_batch_size=1 \
  --max_train_samples=583747 \
  --max_train_steps=50000 \
  --dataloader_num_workers=4 \
  --train_shards_path_or_url='/lustre/scratch/users/hao.zhang/rlsu_files/codefolder/rlsu_osp/Open-Sora-Plan/2m_panda_caption.jsonl' \
  --checkpointing_steps=100 \
  --checkpoints_total_limit=10 \
  --gradient_accumulation_steps=1 \
  --use_8bit_adam \
  --report_to=wandb \
  --resume_from_checkpoint "latest" \
  --text_encoder_name=google/mt5-xxl \
  --loss_type=$LOSS_TYPE \
  --reward_scale=$REWARD_SCALE \