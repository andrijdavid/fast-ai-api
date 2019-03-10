FROM andrijdavid/uvicorn-gunicorn:3-slim

RUN apt update && apt install -y python3-dev gcc cmake build-essential libboost-python-dev  \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir fastapi fastai dlib
