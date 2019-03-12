FROM andrijdavid/uvicorn-gunicorn:3-slim

RUN apt update && apt install -y gcc cmake python3-dev build-essential libboost-python-dev libfreetype6-dev libpng12-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir numpy pyyaml mkl mkl-include setuptools cffi typing numpy 
RUN echo "|--> Install PyTorch" \
    && git clone --recursive https://github.com/pytorch/pytorch \
    && export NO_CUDA=1 \ 
    && cd pytorch && python3 setup.py install \
    && echo "|--> Install Torch Vision" \
    && git clone --recursive https://github.com/pytorch/vision \
    && cd vision && python3 setup.py install 
RUN pip install --no-cache-dir fastai dlib
