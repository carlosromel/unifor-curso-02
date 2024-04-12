#!/bin/bash
# 200 Um número único deveria er sido retornado.

URL=${URL:-http://localhost:8080}

PROCESSO="0000001-01.2020.5.18.0001"

curl --silent \
     --write-out "\n%{http_code}" \
     ${CURL_AUTH} \
     --header    "Accept: application/json" \
     ${URL}/api/casos/${PROCESSO}/

