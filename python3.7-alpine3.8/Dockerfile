FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7-alpine3.8
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --update add --no-cache --virtual boost-python3 cmake gcc gfortran libjpeg-turbo musl-dev freetype-dev .build-deps build-base python3-dev libpng-dev openblas-dev lapack-dev g++ && rm -rf /var/cache/apk/* 
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip3 install --no-cache-dir Pillow-SIMD numpy https://download.pytorch.org/whl/cpu/torch-1.0.0-cp37-cp37m-linux_x86_64.whl torchvision fastai dlib
# removing dependencies
RUN apk del .build-deps
