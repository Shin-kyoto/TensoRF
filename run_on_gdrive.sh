#!/bin/bash

# libs
pip install torch torchvision
pip install tqdm scikit-image opencv-python configargparse lpips imageio-ffmpeg kornia lpips tensorboard plyfile

# run
cd ../../../../
python train.py --config configs/lego.txt --ckpt ./log/nerf_synthetic/VM-48/ckpt/lego.th --render_only 1 --render_test 1 