#!/bin/bash
# 200 A lista de casos deveria ser permitida.

URL=${URL:-http://localhost:8080}

curl --silent \
     --write-out "\n%{http_code}" \
     --header    "Accept: application/json" \
     ${CURL_AUTH} \
     ${URL}/api/casos/

