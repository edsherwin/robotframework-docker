
# **Test Inside Containers:** Dockerize Robot Framework Tests
[![HitCount](http://hits.dwyl.io/edsherwin/robotframework-docker.svg)](http://hits.dwyl.io/edsherwin/robotframework-docker)


# Introduction

The automation test scripts will be executed inside the containers.

## Prerequisite

- [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)


## Installed Robot Framework 3.1.1 Libraries

- [Selenium2Library](https://github.com/robotframework/Selenium2Library)
- [XvfbLibrary](https://github.com/drobota/robotframework-xvfb)
- [JSONLibrary]()
- [HttpLibrary]()
- [SSHLibrary]()
- [ExcelLibrary]()
- [FakerLibrary]()

## Other Installed Applications

- Python 2.14
- Java 8
- Chromedriver 73.0.3683.68
- Google Chrome 73.0.3683.103
- Firefox
- Geckodriver

## Usage
The command below execute in headless.
```sh
robot --variable BROWSER:chrome -x junit.xml --outputdir Results --timestampoutputs project/google/google-search.robot && rebot --outputdir Results --output output.xml --merge results/output-*.xml
```
## Set container as build agent

```sh
nohup java -jar agent.jar -jnlpUrl http://localhost:8080/computer/container-16-01/slave-agent.jnlp -secret 9792b05d5110043f31731e0d4907d3288198f4aacdcbf2dcb71e2f4087e855c5 &
```

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