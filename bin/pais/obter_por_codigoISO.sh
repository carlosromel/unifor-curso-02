#!/bin/bash
# 200 A lista de paises deveria ser permitida.

URL=${URL:-http://localhost:8080}

curl --silent \
     --write-out "\n%{http_code}" \
     ${CURL_AUTH} \
     ${URL}/api/pais/76/

