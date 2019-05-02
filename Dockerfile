FROM ubuntu:16.04
MAINTAINER "Ed Sherwin I. Nonog" <edsherwin.nonog@gmail.com>
LABEL name="Docker image of robotframework environment."
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    python-pip \
    python-dev \
    gcc \
    phantomjs \
    firefox \
    xvfb \
    wget \
    ca-certificates \
    ntpdate \
    libreadline-gplv2-dev \
    libncursesw5-dev \
    libsqlite3-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    unzip \
    git \
    python-tk

# Installation of Python 2.7.14
RUN cd /usr/src
RUN wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz && tar xzf Python-2.7.14.tgz && cd Python-2.7.14 && ./configure --enable-optimations && make altinstall
#   libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation

# Robot Framework and Libraries
RUN apt-get update && pip install \
    robotframework \
    robotframework-sshlibrary \
    robotframework-selenium2library \
    robotframework-httplibrary \
    robotframework-requests \
    robotframework-xvfb \
    robotframework-jsonlibrary \
    robotframework-faker \
    robotframework-excellibrary \
    certifi \
    urllib3[secure] \
    openpyxl \
    pyyaml \
    Pillow \
    ndg-httpsclient \
    pyasn1

# Geckodriver & Chromedriver
RUN cd /usr/src \
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz \
    tar xvzf geckodriver-v0.11.1-linux64.tar.gz \
    rm geckodriver-v0.11.1-linux64.tar.gz \
    cp geckodriver /usr/local/bin \
    chmod +x /usr/local/bin/geckodriver \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    dpkg -i google-chrome*.deb \
    wget https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_linux64.zip \
    unzip chromedriver_linux64.zip \
    cp chromedriver /usr/local/bin \
    chmod +x /usr/local/bin/chromedriver

# Installation of Java
# RUN apt-get update && \
#     apt-get install -y software-properties-common && \
#     apt-get install -y --no-install-recommends locales && \
#     locale-gen en_US.UTF-8 && \
#     apt-get dist-upgrade -y && \
#     apt-get --purge remove openjdk* && \
#     echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
#     echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
#     apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
#     apt-get update && \
#     apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
#     apt-get clean all

# Setting up the container and attach to jenkins as build node
#COPY bin/jenkins-agent.sh /usr/src/app
#CMD ["jenkins-agent.sh","start"]
