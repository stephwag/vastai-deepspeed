FROM nvidia/cuda:11.2.0-cudnn8-devel-ubuntu18.04

RUN apt-get update && \
    apt-get install -y git wget vim build-essential software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.8 python3-pip python3.8-dev llvm-10-dev && \

RUN python3.8 -m pip install --upgrade pip
RUN python3.8 -m pip install -U torch==1.9.0+cu111 -f https://download.pytorch.org/whl/torch_stable.html

RUN git clone https://github.com/Xirider/finetune-gpt2xl.git .

COPY requirements.txt /
RUN python3.8 -m pip install -r --no-cache-dir requirements.txt