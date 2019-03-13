FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7-alpine3.8

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update && apk upgrade && apk --update add --no-cache  boost-python3 libgfortran gfortran cmake gcc libjpeg-turbo  \
    python3-dev libpng-dev freetype-dev g++ libffi-dev libc6-compat git
RUN apk add --update-cache --force-overwrite --no-cache  --virtual=.build-deps lapack jpeg-dev zlib-dev libjpeg build-base musl-dev openblas-dev lapack-dev libgcc
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip3 install --no-cache-dir numpy pyyaml mkl mkl-include setuptools cffi typing
RUN echo "|--> Install PyTorch" \
    && git clone --recursive https://github.com/pytorch/pytorch \
    && export NO_CUDA=1 \ 
    && export NO_CAFFE2_OPS=1 \
    && cd pytorch \
    && export latest_pytorch_tag=$(git describe --tags) \
    && echo checking out ${latest_pytorch_tag} \
    && git checkout ${latest_pytorch_tag} \
    && python3 setup.py install \
    && echo "|--> Install Torch Vision" \
    && git clone --recursive https://github.com/pytorch/vision \
    && cd vision \ 
    && export latest_pytorchv_tag=$(git describe --tags) \
    && echo checking out ${latest_pytorchv_tag} \
    && git checkout ${latest_pytorch_tag} \
    && python3 setup.py install 
RUN pip3 install --no-cache-dir fastai dlib
RUN pip3 uninstall --no-cache-dir -y pillow pil jpeg libtiff
RUN CC="cc -mavx2" pip3 install --no-cache-dir -U --force-reinstall --no-binary :all: --compile pillow-simd
# removing dependencies
RUN apk del --purge .build-deps build-base jpeg-dev \ 
    libpng-dev gfortran python3-dev musl \
    openblas openblas-dev musl-dev nghttp2-libs git \
    && echo "|--> Cleaning" \
    && rm -rf /pytorch \
    && find /usr/lib/python3.7 -name __pycache__ | xargs rm -r \
    && rm -rf /root/.cache \
    && rm -rf /root/.[acpw]* \
    && rm -rf /var/cache/apk/*
