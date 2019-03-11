FROM andrijdavid/uvicorn-gunicorn:3-slim

RUN apt update && apt install -y gcc cmake python3-dev build-essential libboost-python-dev libfreetype6-dev libpng12-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir fastapi numpy 
RUN pip install --no-cache-dir https://download.pytorch.org/whl/cpu/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl fastai dlib
