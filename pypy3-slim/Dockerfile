FROM andrijdavid/uvicorn-gunicorn:3-slim

RUN echo "deb http://deb.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian-security/ stretch/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list

RUN apt update && apt install -y cmake gcc python3-dev git build-essential libboost-python-dev libfreetype6-dev libpng-dev pkg-config libnuma-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir numpy pyyaml mkl mkl-include setuptools cffi typing numpy 
RUN echo "|--> Install PyTorch" \
    && git clone --recursive https://github.com/pytorch/pytorch \
    && export NO_CUDA=1 \ 
    && export NO_CAFFE2_OPS=1 \
    && export BUILD_TORCH=NO \
    && export USE_SYSTEM_NCCL=0 \
    && export USE_CUDNN=0 \
    && cd pytorch \     
    && export latest_pytorch_tag=$(git describe --abbrev=0 --tags) \
    && echo checking out ${latest_pytorch_tag} \
    && git checkout ${latest_pytorch_tag} \
    && git submodule update --init --recursive  \
    && pypy3 setup.py install \
    && echo "|--> Install Torch Vision" \
    && git clone --recursive https://github.com/pytorch/vision \
    && cd vision \ 
    && export latest_pytorchv_tag=$(git describe --abbrev=0 --tags) \
    && echo checking out ${latest_pytorchv_tag} \
    && git checkout ${latest_pytorch_tag} \
    && pypy3 setup.py install 
RUN pip install --no-cache-dir fastai dlib
RUN echo "|--> Cleaning" \
    && apt -y remove git \
    && apt -y autoremove \
    && rm -rf /pytorch \
    && find /usr/lib/python3.6 -name __pycache__ | xargs rm -r \
    && rm -rf /root/.cache \
    && rm -rf /root/.[acpw]* 
