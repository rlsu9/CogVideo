rm -rf /ephemeral/hao.zhang/ckptfolder/CogVideoX-2b/transformer/*
mkdir -p /ephemeral/hao.zhang/codefolder/CogVideo/inference/output

STEP_LIST=(6000 6100)

for STEP in "${STEP_LIST[@]}"; do
    cp -r /ephemeral/hao.zhang/ckptfolder/cogvid_2b/huber/1e-7/1.0/checkpoint-${STEP}/transformer/* /ephemeral/hao.zhang/ckptfolder/CogVideoX-2b/transformer/
    mkdir -p /ephemeral/hao.zhang/codefolder/CogVideo/inference/output/${STEP}
    OUTPUT_PATH=/ephemeral/hao.zhang/codefolder/CogVideo/inference/output/${STEP}/test.mp4

    python cli_demo.py --prompt "A girl riding a bike." --model_path /ephemeral/hao.zhang/ckptfolder/CogVideoX-2b --generate_type "t2v" --output_path ${OUTPUT_PATH}
done