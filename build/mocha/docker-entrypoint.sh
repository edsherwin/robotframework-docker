#!/bin/bash

set -e

echo -e "Hello world"

#Connect agent to Jenkins.
java -jar agent.jar -jnlpUrl http://172.17.03:8080/computer/ubuntu/slave-agent.jnlp -secret dd5991c44b15d7ff37fd7ed801eecafe890a98ede64b785a7b22f212479966b7 -workDir "/usr/app"

exit