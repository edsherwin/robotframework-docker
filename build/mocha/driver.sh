#!/bin/bash
#
# --------------------------------------------------------------------------------------
# Installation script for setting up browser driver such as chromedriver and geckodriver
# --------------------------------------------------------------------------------------
#Mozilla Firefox 67.0.4
#geckodriver 0.11.1
apt-get -f install
wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz
tar xvzf geckodriver-v0.11.1-linux64.tar.gz
rm geckodriver-v0.11.1-linux64.tar.gz
cp geckodriver /usr/local/bin
chmod +x /usr/local/bin/geckodriver
#Google Chrome 75.0.3770.100
#ChromeDriver 73.0.3683.68 (47787ec04b6e38e22703e856e101e840b65afe72)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb
wget https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
cp chromedriver /usr/local/bin
chmod +x /usr/local/bin/chromedriver