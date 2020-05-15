#!/bin/bash
apt-get -f install -y
apt-get update -y && apt-get install -y software-properties-common python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get install -y default-jre && apt-get -y install default-jdk