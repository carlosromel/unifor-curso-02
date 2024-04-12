#!/bin/bash
# 200 A lista de estados deveria ser permitida.

URL=${URL:-http://localhost:8080}

curl --silent \
     --write-out "\n%{http_code}" \
     ${CURL_AUTH} \
     ${URL}/api/estado/

