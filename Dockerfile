FROM ubuntu:20.04

WORKDIR /root/spatial_access
ENV DEBIAN_FRONTEND=noninteractive 

# Install base utilities
RUN apt-get update \
    && apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

RUN conda init \
    && bash ~/.bashrc \
    && . ~/.bashrc \
    && conda create --name spatial_access python=3.6.3 jupyter \
    && conda activate spatial_access \
    && apt-get update \
    && apt-get install -y libspatialindex-dev \
    && apt-get install -y python-tk \
    && pip install --upgrade pip \
    && apt install -y python3-pip \
    && pip3 install spatial_access

RUN cd ~ && \
    git clone https://github.com/GeoDaCenter/spatial_access.git

EXPOSE 9000

