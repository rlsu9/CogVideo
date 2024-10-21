pip install accelerate transformers diffusers webdataset loralib peft pytorch_lightning open_clip_torch==2.24.0 hpsv2 image-reward peft wandb av einops packaging omegaconf opencv-python kornia moviepy imageio

pip install flash-attn --no-build-isolation
git clone https://github.com/Dao-AILab/flash-attention.git
cd flash-attention
pip install csrc/fused_dense_lib csrc/layer_norm

conda install xformers -c xformers