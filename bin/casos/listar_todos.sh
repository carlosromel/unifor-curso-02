#!/bin/bash
# 200 O método deveria retornar uma lista.

URL=${URL:-http://localhost:8080}

curl --silent \
     --write-out "\n%{http_code}" \
     ${CURL_AUTH} \
     --header    "Accept: application/json" \
     ${URL}/api/casos/

