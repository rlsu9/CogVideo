pip install peft datasets bitsandbytes hpsv2 wandb

gsutil cp gs://vid_gen/runlong_temp_folder_for_pandas70m_debugging/bpe_simple_vocab_16e6.txt.gz .

cp bpe_simple_vocab_16e6.txt.gz home/ubuntu/miniconda3/envs/cogvid/lib/python3.10/si
te-packages/hpsv2/src/open_clip/

cd cm
mkdir hpsv2
gsutil cp gs://vid_gen/runlong_temp_folder_for_pandas70m_debugging/HPS_v2.1_compressed.pt ./hpsv2

bash ./reward_reliance.sh