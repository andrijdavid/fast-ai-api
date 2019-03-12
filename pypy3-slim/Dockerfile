FROM andrijdavid/uvicorn-gunicorn:3-slim

RUN echo "deb http://deb.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian stretch main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian-security/ stretch/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian-security/ stretch/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list
RUN apt update && apt install -y gcc cmake python3-dev git build-essential libboost-python-dev libfreetype6-dev libpng-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir numpy pyyaml mkl mkl-include setuptools cffi typing numpy 
RUN echo "|--> Install PyTorch" \
    && git clone --recursive https://github.com/pytorch/pytorch \
    && export NO_CUDA=1 \ 
    && cd pytorch && pypy3 setup.py install \
    && echo "|--> Install Torch Vision" \
    && git clone --recursive https://github.com/pytorch/vision \
    && cd vision && pypy3 setup.py install 
RUN pip install --no-cache-dir fastai dlib
RUN echo "|--> Cleaning" \
    && rm -rf /pytorch \
    && find /usr/lib/python3.6 -name __pycache__ | xargs rm -r \
    && rm -rf /root/.cache \
    && rm -rf /root/.[acpw]* 
