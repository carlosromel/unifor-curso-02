#!/bin/bash

#URL="http://localhost:8081/api/casos/"
#URL="http://localhost:8081/api/arquivos/"
URL="http://localhost:8081/"
#> authorization: basic cm9tzww6mtiz
#> authorization: basic cm9tzww6mtizcg==

curl --verbose \
     --request POST \
     --header  "Accept: application/json" \
     --user    "romel:123" \
     ${URL} | jq

