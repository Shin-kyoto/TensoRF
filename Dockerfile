FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
ENV DEBIAN_FRONTEND=noninteractive

ENV ROOT /TensoRF
WORKDIR $ROOT

RUN pip install torch torchvision
RUN pip install tqdm scikit-image opencv-python configargparse lpips imageio-ffmpeg kornia lpips tensorboard plyfile