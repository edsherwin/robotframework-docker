FROM ubuntu:16.04

MAINTAINER "Ed Sherwin" <edsherwin.nonog@gmail.com>

LABEL name="Docker build for acceptance testing using the robotframework"

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev
RUN apt-get install -y python-pip python-dev gcc phantomjs firefox
RUN apt-get install -y xvfb zip wget
RUN apt-get install ca-certificates
RUN apt-get install ntpdate
RUN apt-get install python-pip
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

# Installation of Python 2.7.14
RUN cd /usr/src
RUN wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
RUN tar xzf Python-2.7.14.tgz && cd Python-2.7.14.tgz && ./configure && make install
RUN apt-get update
RUN apt-get install -y libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation
RUN pip install --upgrade pip
RUN pip install robotframework
RUN pip install robotframework-sshlibrary
RUN pip install robotframework-selenium2library
RUN pip install -U robotframework-httplibrary
RUN pip install -U requests[security] && pip install -U robotframework-requests
RUN pip install robotframework-xvfb
RUN pip install certifi
RUN pip install urllib3[secure]
RUN pip install robotframework-excellibrary
RUN pip install openpyxl
RUN pip install pyyaml
RUN pip install Pillow
RUN pip install ndg-httpsclient
RUN pip install pyopenssl
RUN pip install pyasn1
RUN pip install robotframework-jsonlibrary
#RUN pip install --upgrade robotframework-httplibrary

# Geckodriver & Chromedriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz
RUN tar xvzf geckodriver-v0.11.1-linux64.tar.gz
RUN rm geckodriver-v0.11.1-linux64.tar.gz
RUN cp geckodriver /usr/local/bin && chmod +x /usr/local/bin/geckodriver
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
RUN wget https://chromedriver.storage.googleapis.com/2.46/chromedriver_linux64.zip && unzip chromedriver_linux64.zip
RUN cp chromedriver /usr/local/bin && chmod +x /usr/local/bin/chromedriver
RUN apt-get install -y git

# Installation of Java

RUN  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install -y software-properties-common
RUN apt-get update && add-apt-repository ppa:webupd8team/java
RUN apt-get install -y default-jre
RUN apt-get install -y default-jdk
RUN apt-get update
RUN rm -fR /var/lib/apt/lists/*
RUN apt-get -y update
RUN apt-get install -y oracle-java8-installer
