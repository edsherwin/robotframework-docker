FROM python:3.8-alpine3.11
MAINTAINER Ed Sherwin Nonog <edsherwin.nonog@gmail.com>
LABEL description Test inside docker containers alongside Robot Framework.

# Working directory
WORKDIR /usr/src/app

# Set environment for reports
ENV REPORT_DIR /usr/src/app/reports

# Copy filespwe
COPY . /usr/src/app

# Install system dependencies
RUN apk update \
  && apk --no-cache upgrade \
  && apk --no-cache --virtual .build-deps add \
    gcc \
    libffi-dev \
    linux-headers \
    make \
    musl-dev \
    openssl-dev \
    which \
    wget 
# FIXME: above is a workaround, as the path is ignored

# ROBOTFRAMEWORK INSTALLATION DIRECTORY
RUN pip install -r requirements.txt

# 
RUN chmod +x *.sh

# INSTALLATION OF BROWSER DRIVER AND JAVA
#RUN ./driver.sh
#RUN ./java.sh