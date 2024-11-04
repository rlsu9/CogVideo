git clone https://github.com/rlsu9/CogVideo.git
cd CogVideo
conda create -n cogvideo_cm python==3.11.10 -y
conda activate cogvideo_cm
pip install -r requirements.txt

pip install peft datasets bitsandbytes hpsv2 wandb

gsutil cp gs://vid_gen/runlong_temp_folder_for_pandas70m_debugging/bpe_simple_vocab_16e6.txt.gz .

cp bpe_simple_vocab_16e6.txt.gz PATH/TO/YOUR/miniconda3/envs/cogvid_cm/lib/python3.11/site-packages/hpsv2/src/open_clip/

cd cm
mkdir hpsv2
gsutil cp gs://vid_gen/runlong_temp_folder_for_pandas70m_debugging/HPS_v2.1_compressed.pt ./hpsv2

bash ./reward_reliance.sh