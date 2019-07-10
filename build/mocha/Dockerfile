FROM ubuntu:16.04

MAINTAINER "Ed Sherwin" <edsherwin.nonog@gmail.com>

LABEL name="Docker build for acceptance testing using the robot framework"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD driver.sh /driver.sh
COPY driver.sh /driver.sh
COPY java.sh /java.sh
COPY agent.jar /agent.jar
ADD jenkins-slave.sh /jenkins-slave.sh
COPY jenkins-slave.sh /jenkins-slave.sh
RUN chmod +x /*.sh

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
    python-tk \
    libnss3

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
    pyasn1 \
    robotframework-metrics==3.1.2
# Installation script for setting up browser
RUN /driver.sh
RUN /java.sh

#CMD ["jenkins-slave.sh"]