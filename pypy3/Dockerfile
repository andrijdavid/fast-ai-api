FROM andrijdavid/uvicorn-gunicorn:3

RUN apt update && apt install -y gcc cmake python3-dev build-essential libboost-python-dev libfreetype6-dev libpng12-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir fastapi fastai dlib
