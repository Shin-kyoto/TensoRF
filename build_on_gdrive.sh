#!/bin/bash

mkdir {data,log}
mkdir ./data/nerf_synthetic
mkdir ./data/nerf_llff_data
mkdir ./data/TanksAndTemple
mkdir ./data/Synthetic_NSVF

cd ./data

# nerf_synthetic
bash ../drive_download.sh 18JxhpWD-4ZmuFKLzKlAw-w5PpzZxXOcG nerf_synthetic.zip
unzip nerf_synthetic.zip
rm -rf __MACOSX/

# nerf_llff_data
bash ../drive_download.sh 16VnMcF1KJYxN9QId6TClMsZRahHNMW5g nerf_llff_data.zip
unzip nerf_llff_data.zip

# TanksAndTemple
wget https://dl.fbaipublicfiles.com/nsvf/dataset/TanksAndTemple.zip
unzip TanksAndTemple.zip

# Synthetic_NSVF
wget https://dl.fbaipublicfiles.com/nsvf/dataset/Synthetic_NSVF.zip
unzip Synthetic_NSVF.zip

# ckpt
cd ../log/nerf_synthetic/VM-48/ckpt/
bash ../../../../onedrive_download.sh
unzip ckpt.zip

# libs
pip install torch torchvision
pip install tqdm scikit-image opencv-python configargparse lpips imageio-ffmpeg kornia lpips tensorboard plyfile

# run
cd ../../../../
python train.py --config configs/lego.txt --ckpt ./log/nerf_synthetic/VM-48/ckpt/lego.th --render_only 1 --render_test 1 