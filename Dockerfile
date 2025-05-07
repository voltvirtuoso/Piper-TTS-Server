# Use an official Python runtime as a parent image
FROM python:3.10-slim
ENV PIPER_MODEL=en_US-lessac-medium.onnx
ENV PIPER_DIR=/usr/local/piper

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    vim	\
    && rm -rf /var/lib/apt/lists/*

WORKDIR $PIPER_DIR

# Install piper from GitHub
RUN git clone https://github.com/rhasspy/piper.git 

RUN	cd $PIPER_DIR/piper/src/python_run && pip install -e .  && mkdir $PIPER_DIR/models
#	cd piper && mkdir build && cd build && cmake .. && make

RUN pip install --no-cache-dir -r $PIPER_DIR/piper/src/python_run/requirements_http.txt

CMD python -m piper.http_server --model $PIPER_MODEL
