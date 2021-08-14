FROM nvidia/cuda:11.2.0-cudnn8-devel-ubuntu18.04

COPY requirements.txt /requirements.txt
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        git \
        wget \
        vim \
        build-essential \
        software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        python3.8 \
        python3-pip \
        python3.8-dev \
        llvm-10-dev && \

    python3.8 -m pip install --upgrade pip && \
    python3.8 -m pip install --no-cache-dir --ignore-installed PyYAML setuptools && \
    python3.8 -m pip install --no-cache-dir -U torch==1.9.0+cu111 -f https://download.pytorch.org/whl/torch_stable.html && \
    python3.8 -m pip install --no-cache-dir -r /requirements.txt && \
    mkdir /app && \
    git clone https://github.com/Xirider/finetune-gpt2xl.git /app
