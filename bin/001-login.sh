#!/bin/bash

URL="http://localhost:8081/api/casos/"
#URL="http://localhost:8081/api/arquivos/"
#URL="http://localhost:8081/"

curl --verbose \
     --request POST \
     --user    "romel:123" \
     ${URL} #| jq

