
# **Test Inside Containers:** Dockerize Robot Framework Tests
[![HitCount](http://hits.dwyl.io/edsherwin/robotframework-docker.svg)](http://hits.dwyl.io/edsherwin/robotframework-docker)


# Introduction

The automation test scripts will be executed inside the containers.

## Prerequisite

- [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)
- [Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)


## Installed Robot Framework 3.1.1 Libraries

- [Selenium2Library](https://github.com/robotframework/Selenium2Library)
- [XvfbLibrary](https://github.com/drobota/robotframework-xvfb)
- [JSONLibrary]()
- [HttpLibrary]()
- [SSHLibrary]()
- [ExcelLibrary]()
- [FakerLibrary]()

## Pre-installed Applications

- Python 2.14
- Java 8
- ChromeDriver 75.0.3770.90
- Google Chrome 75.0.3770.100
- Firefox
- Geckodriver

## Usage
The command below execute in headless.
```sh
robot --variable BROWSER:chrome -x junit.xml --outputdir Results --timestampoutputs project/google/google-search.robot && rebot --outputdir Results --output output.xml --merge results/output-*.xml
```
## Setting the container as build agent in Jenkins

Below command is configured through Jenkins.

```sh
$ java -jar agent.jar -jnlpUrl http://localhost:8080/computer/cotainer-build-01/slave-agent.jnlp -secret 75c7c48273db32fdcb0e72d8032cc28f80348974c5fc9e88012df9fa7b6f8e7e	
```
java -jar {agent.jar} -jnlpUrl {Url of your Jenkins/name of the node/slave-agent.jnlp} -secret {secret key here}

### Global Setup and Teardown

When updating the Global Setup and Teardown robot file to be able to run test scripts on local machines, run the following command (this command is used in order to tell Git to ignore changes on the file being mentioned):
```sh
git update-index --assume-unchanged resources/keywords/setup/Global_Setup_and_Teardown.robot
```

When pulling updates from the repository, run the following command in order to remove the error regarding the Global Setup and Teardown robot file (this command resets your changes on the Global Setup and Teardown file to enable you to pull changes from the repository):
```sh
git checkout resources/keywords/setup/Global_Setup_and_Teardown.robot
```

# Docker

Rebuilding the images and containers

```sh
$ docker-compose build
$ docker-compose up -d
```

# Jenkins

## Node properties

Environment variables

- Name: BROWSER
- Value: name of browser to used. e.g. chrome



Run robot script using execute shell.

```sh
$ rm -rf Results/*.xml && \
$ robot --variable BROWSER:$BROWSER -x junit.xml --outputdir results --timestampoutputs project/google/google-search.robot && rebot --outputdir results --output output.xml --merge results/output-*.xml && \
```

## Robot Framework in 3.1.1 Guide using Python3 and higher

### Python 3.7.2

```sh
Python version directory - (https://www.python.org/ftp/python)

$ wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
$ tar xzf Python-3.7.2.tgz
$ cd Python-3.7.2 && ./configure && make install
```

### RobotFramework Installation to Python 3.7.2

```sh
$ pip3 install robotframework
$ robot --version

Robot Framework 3.1.1 (Python 3.7.2 on linux)

```

### JSONLibrary

```sh
1. git clone https://github.com/nottyo/robotframework-jsonlibrary
2. cd robotframework-jsonlibrary
3. Edit the _init.py in the JSONLibrary directory so the imports on line 2 & 3 as follow:

from JSONLibrary.JSONLibraryKeywords import JSONLibraryKeywords
from JSONLibrary.version import VERSION

and also edit JSONLibraryKeywords.py in line 4:

JSONLibrary.version import VERSION

4. python3 setup.py install
5. pip3 install ../robotframework-jsonlibrary
```