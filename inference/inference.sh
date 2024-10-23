rm -rf /lustre/scratch/users/hao.zhang/rlsu_files/resourcefolder/CogVideoX-2b/transformer/*
mkdir -p /lustre/scratch/users/hao.zhang/rlsu_files/codefolder/haocog/CogVideo/inference/output_turbo

LR_LIST=(1e-6 3e-7 5e-7)
STEP_LIST=(100 200 300 400 500)

for LR in "${LR_LIST[@]}"; do
    for STEP in "${STEP_LIST[@]}"; do
        cp -r /lustre/scratch/users/hao.zhang/rlsu_files/ckptfolder/cogvid_2b_turbo/huber/${LR}/1.0/checkpoint-${STEP}/transformer/* /lustre/scratch/users/hao.zhang/rlsu_files/resourcefolder/CogVideoX-2b/transformer/
        mkdir -p /lustre/scratch/users/hao.zhang/rlsu_files/codefolder/haocog/CogVideo/inference/output_turbo/${LR}/${STEP}
        OUTPUT_PATH=/lustre/scratch/users/hao.zhang/rlsu_files/codefolder/haocog/CogVideo/inference/output_turbo/${LR}/${STEP}/test.mp4

        python cli_demo.py --prompt "A girl riding a bike." --model_path /lustre/scratch/users/hao.zhang/rlsu_files/resourcefolder/CogVideoX-2b --generate_type "t2v" --output_path ${OUTPUT_PATH}
    done
done