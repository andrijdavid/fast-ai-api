FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7-alpine3.8

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update && apk --update add --no-cache  boost-python3 libgfortran gfortran  cmake gcc libjpeg-turbo   \
    python3-dev libpng-dev freetype-dev  g++ 
RUN apk add --update-cache --force-overwrite --no-cache  --virtual=.build-deps lapack jpeg-dev zlib-dev libjpeg build-base musl-dev openblas-dev lapack-dev libgcc
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip3 install --no-cache-dir numpy https://download.pytorch.org/whl/cpu/torch-1.0.0-cp37-cp37m-linux_x86_64.whl torchvision fastai dlib
RUN pip3 uninstall --no-cache-dir -y pillow pil jpeg libtiff
RUN CC="cc -mavx2" pip3 install --no-cache-dir -U --force-reinstall --no-binary :all: --compile pillow-simd
# removing dependencies
RUN apk del --purge .build-deps build-base jpeg-dev \ 
    libpng-dev gfortran python3-dev musl \
    openblas openblas-dev musl-dev nghttp2-libs \
    && rm -rf /root/.cache \
    && rm -rf /root/.[acpw]* \
    && rm -rf /var/cache/apk/*
