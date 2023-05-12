FROM ubuntu:20.04


RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt -qq update --fix-missing && \
    apt -qq install -y git \
    aria2 \
    wget \
    curl \
    busybox \
    unzip \
    unrar \
    tar \
    zip \
    python3 \
    ffmpeg \
    python3-pip \
    p7zip-full \
    p7zip-rar

RUN wget https://rclone.org/install.sh
RUN bash install.sh

RUN mkdir /app/gopal
RUN wget -O /app/gopal/gclone.gz https://github.com/donwa/gclone/releases/download/v1.51.0-mod1.3.1/gclone_1.51.0-mod1.3.1_Darwin_x86_64.gz
RUN gzip -d /app/gopal/gclone.gz
RUN chmod 0775 /app/gopal/gclone

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
