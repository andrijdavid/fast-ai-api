FROM tiangolo/uvicorn-gunicorn-fastapi:python3.6
RUN apt update && apt install -y python3-dev gcc cmake build-essential libboost-python-dev  \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir fastai dlib
