FROM andrijdavid/uvicorn-gunicorn:3

RUN echo "deb http://deb.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian-security/ stretch/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list

RUN apt -qq update && apt install -qq --no-install-recommends -y gcc cmake python3-dev git build-essential libboost-python-dev libfreetype6-dev libpng-dev pkg-config libnuma-dev 
RUN pip install --no-cache-dir numpy pyyaml mkl mkl-include setuptools cffi typing numpy 
RUN echo "|--> Install PyTorch" \
    && git clone --recursive https://github.com/pytorch/pytorch \
    && export NO_CUDA=1 \ 
    && export NO_CAFFE2_OPS=1 \
    && cd pytorch \
    && export latest_pytorch_tag=$(git describe --tags) \
    && echo checking out ${latest_pytorch_tag} \
    && git checkout ${latest_pytorch_tag} \
    && pypy3 setup.py install \
    && echo "|--> Install Torch Vision" \
    && git clone --recursive https://github.com/pytorch/vision \
    && cd vision \ 
    && export latest_pytorchv_tag=$(git describe --tags) \
    && echo checking out ${latest_pytorchv_tag} \
    && git checkout ${latest_pytorch_tag} \
    && pypy3 setup.py install 
RUN pip install --no-cache-dir fastai dlib
RUN echo "|--> Cleaning" \
    && rm -rf /pytorch \
    && find /usr/lib/python3.6 -name __pycache__ | xargs rm -r \
    && rm -rf /root/.cache \
    && rm -rf /root/.[acpw]* \
    && rm -rf /var/lib/apt/lists/*
