
# **Test Inside Containers:** Dockerize Robot Framework Tests
[![HitCount](http://hits.dwyl.io/edsherwin/robotframework-docker.svg)](http://hits.dwyl.io/edsherwin/robotframework-docker)


It works!

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
nohup java -jar agent.jar -jnlpUrl http://127.0.0.1:8080/computer/container-16-01/slave-agent.jnlp -secret 9792b05d5110043f31731e0d4907d3288198f4aacdcbf2dcb71e2f4087e855c5 &
```