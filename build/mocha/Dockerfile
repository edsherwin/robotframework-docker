FROM ubuntu:xenial-20190515

MAINTAINER "Ed Sherwin" <edsherwin.nonog@gmail.com>

LABEL name="Docker build for acceptance testing using the robot framework"

#ENTRYPOINT OF SLAVE TO BE CONNECTED THROUGH JENKINS
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

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

# PYTHON INSTALLATION
RUN wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz && tar xzf Python-2.7.14.tgz && cd Python-2.7.14 && ./configure --enable-optimations && make altinstall

# ROBOTFRAMEWORK INSTALLATION
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


#COPY ALL TO WORKING DIRECTORY
COPY . /usr/app

WORKDIR /usr/app

RUN chmod +x *.sh

# INSTALLATION OF BROWSER DRIVER AND JAVA
#RUN ./driver.sh
#RUN ./java.sh