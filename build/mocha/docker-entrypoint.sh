#!/bin/bash

set -e

echo -e "Hello world"

java -jar agent.jar -jnlpUrl http://10.0.118.50:8080/computer/container-19-01/slave-agent.jnlp -secret 30b9932d09666f69b0be032aa1b9bc618d0cf3806ed2de7d9eee57e5c64ccc29

exit