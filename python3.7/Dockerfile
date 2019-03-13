FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7
RUN apt update && apt install -y python3-dev gcc cmake build-essential libboost-python-dev  \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir fastai dlib
RUN RUN echo "|--> Cleaning" \
    && apt -y autoremove \
    && find /usr/lib/python3.7 -name __pycache__ | xargs rm -r \
    && rm -rf /root/.cache \
    && rm -rf /root/.[acpw]* 

