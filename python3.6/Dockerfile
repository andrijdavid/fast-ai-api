FROM tiangolo/uvicorn-gunicorn-fastapi:python3.6
RUN apt update && apt install --no-install-recommends -y python3-dev gcc cmake build-essential libboost-python-dev
RUN pip install --no-cache-dir fastai dlib
RUN RUN echo "|--> Cleaning" \
    && apt -y autoremove \
    && find /usr/lib/python3.6 -name __pycache__ | xargs rm -r \
    && rm -rf /root/.cache \
    && rm -rf /root/.[acpw]* \
    && rm -rf /var/lib/apt/lists/*

