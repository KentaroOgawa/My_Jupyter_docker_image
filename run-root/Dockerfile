FROM  nvidia/cuda:11.4.0-cudnn8-devel-ubuntu20.04

# SHELL
SHELL [ "/bin/bash", "-c" ]

# Locale
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

ENV NOTO_DIR /usr/share/fonts/opentype/notosans

# TimeZone setting
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get update \
    && apt-get install -y tzdata

## General tools
RUN apt update \
    && apt install -y \
    bzip2 \
    ca-certificates \
    curl \
    libcurl4-openssl-dev \
    ffmpeg \
    file \
    git \
    imagemagick \
    libmagick++-dev \
    libglib2.0-0 \
    libglib2.0-dev \
    libopenmpi-dev \
    libopenmpi3 \
    libpoppler-cpp-dev \
    libpoppler-glib-dev \
    libsm6 \
    libssl-dev \
    libssh2-1-dev \
    libudunits2-dev \
    libxext6 \
    libxml2-dev \
    libxrender1 \
    libfreetype6-dev \
    libglu1-mesa-dev \
    libgl1-mesa-dev \
    liblzma-dev \
    libbz2-dev \ 
    libicu-dev \
    make \
    # mercurial \
    ocl-icd-opencl-dev \
    openssh-server \
    sudo \
    software-properties-common \
    unzip \
    vim \
    wget \
    xz-utils \
    zlib1g-dev \
    zsh

# C/C++
RUN apt install -y \
    gcc \
    g++ \
    libatlas-base-dev \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev 

# Python
RUN apt install -y \
    python3 \
    python3-pip

# Gauche
RUN apt install -y \
    gauche \
    gauche-c-wrapper \
    gauche-dev \
    gauche-doc \
    gauche-gdbm \
    gauche-zlib \
    libgauche-0.9-0 \
    slib

# R
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN apt update \
    && apt install -y \
    r-base \
    r-base-dev
COPY R_package_install.R /tmp/
# RDBs
# RUN apt install -y \
# mysql-server \
# libmysqlclient-dev \
# libpq-dev \
# unixodbc-dev \

# Julia
RUN wget -O - 'https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.3-linux-x86_64.tar.gz' | tar zxvf - -C /opt/
RUN ln -s /opt/julia-1.6.3/bin/julia /usr/local/bin/julia

# Dbug用ツール
RUN apt update \
    && apt install -y \
    iproute2

# Noto fonts
RUN mkdir -p ${NOTO_DIR} &&\
  wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip -O noto.zip &&\
  unzip ./noto.zip -d ${NOTO_DIR}/ &&\
  chmod a+r ${NOTO_DIR}/NotoSans* &&\
  rm ./noto.zip

# remove cache files
RUN apt-get autoremove -y && apt-get clean && \
  rm -rf /usr/local/src/*

# nodejsの導入
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && sudo apt-get install -y nodejs

COPY requirements.txt /tmp/


ENV PATH /root/.local/bin:${PATH}

# Python
RUN pip install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -r /tmp/requirements.txt

# R
RUN Rscript /tmp/R_package_install.R

# Gauche
RUN pip install --no-cache-dir jupyter_gauche \
    && python3 -m jupyter_gauche.install

# Julia
RUN julia -e 'ENV["PYTHON"]="/usr/local/bin/python3"; using Pkg; Pkg.add("PyCall")'
# install jupyter
RUN julia -e 'using Pkg; Pkg.add("IJulia"); using IJulia'
# install PyPlot and Sympy
RUN julia -e 'using Pkg; Pkg.add("PyPlot"); using PyPlot'
# install SymPy
RUN julia -e 'using Pkg; Pkg.add("SymPy"); using SymPy'
# add PackageCompiler to build Package or generate executable module
RUN julia -e 'using Pkg; Pkg.add("PackageCompiler"); using PackageCompiler'
# install Plots
RUN apt-get install -y qt5-default
RUN julia -e 'using Pkg; Pkg.add(["UnicodePlots", "GR", "Plots"]);\
              using UnicodePlots, GR, Plots'
#compile Plots to reduce overhead of `using Plots`
#RUN julia -e 'using Pkg;\
#              using PackageCompiler; compile_package("Plots",force=true);\
#              using Plots'
# inslall CUDA
RUN julia -e 'using Pkg; Pkg.add("CUDA"); using CUDA'
# inslall Flux
RUN julia -e 'using Pkg; Pkg.add("Flux"); using Flux'
# inslall Mocha
#RUN julia -e 'using Pkg; Pkg.add("Mocha"); using Mocha'
# inslall Knet
RUN julia -e 'using Pkg; Pkg.add("Knet"); using Knet'
# inslall ScikitLearn
RUN julia -e 'using Pkg; Pkg.add("ScikitLearn"); using ScikitLearn'
# inslall MLBase
RUN julia -e 'using Pkg; Pkg.add("MLBase"); using MLBase'
# inslall Merlin
#RUN julia -e 'using Pkg; Pkg.add("Merlin"); using Merlin'
# inslall DifferentialEquations
RUN julia -e 'using Pkg; Pkg.add("DifferentialEquations"); using DifferentialEquations'
# inslall Gen
RUN julia -e 'using Pkg; Pkg.add("Gen"); using Gen'

# inslall GLM
RUN julia -e 'using Pkg; Pkg.add("GLM"); using GLM'
# inslall Lasso
RUN julia -e 'using Pkg; Pkg.add("Lasso"); using Lasso'
# inslall Loess
RUN julia -e 'using Pkg; Pkg.add("Loess"); using Loess'

# inslall StatsKit
RUN julia -e 'using Pkg; Pkg.add("StatsKit"); using StatsKit'
# inslall StatsBase
RUN julia -e 'using Pkg; Pkg.add("StatsBase"); using StatsBase'
# inslall StatsModels
RUN julia -e 'using Pkg; Pkg.add("StatsModels"); using StatsModels'
# inslall DataFrames
RUN julia -e 'using Pkg; Pkg.add("DataFrames"); using DataFrames'
# inslall Distributions
RUN julia -e 'using Pkg; Pkg.add("Distributions"); using Distributions'
# inslall MultivariateStats
RUN julia -e 'using Pkg; Pkg.add("MultivariateStats"); using MultivariateStats'
# inslall HypothesisTests
RUN julia -e 'using Pkg; Pkg.add("HypothesisTests"); using HypothesisTests'
# inslall Distances
RUN julia -e 'using Pkg; Pkg.add("Distances"); using Distances'
# inslall MultipleTesting
RUN julia -e 'using Pkg; Pkg.add("MultipleTesting"); using MultipleTesting'
# inslall CSV
RUN julia -e 'using Pkg; Pkg.add("CSV"); using CSV'
# inslall RCall
RUN julia -e 'using Pkg; Pkg.add("RCall"); using RCall'
# inslall RDatasets
RUN julia -e 'using Pkg; Pkg.add("RDatasets"); using RDatasets'

# JupyterLabの拡張機能

# 変数や行列の中身を確認
RUN jupyter labextension install @lckr/jupyterlab_variableinspector@3.0.7

# 自動整形
RUN pip install autopep8 \
    && pip install jupyterlab_code_formatter \
    && jupyter serverextension enable --py jupyterlab_code_formatter \
    && jupyter labextension install @ryantam626/jupyterlab_code_formatter
#COPY --chown=USER_NAME:USER_GROUP .jupyter/lab/user-settings/ /home/USER_NAME/.jupyter/lab/user-settings/

# jupyter の config ファイルの作成
#RUN mkdir /mlws && echo "c.NotebookApp.notebook_dir = '/mlws' \n" | tee -a /home/USER_NAME/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.notebook_dir = '/analysis' \n" | tee -a /root/.jupyter/jupyter_notebook_config.py

WORKDIR /analysis/

EXPOSE 8888

CMD ["python3", "-m", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''"]
