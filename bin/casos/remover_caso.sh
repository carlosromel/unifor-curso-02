#!/bin/bash
# 204 O caso deveria ter sido removido.

URL=${URL:-http://localhost:8080}
PROCESSO="0000022-12.1972.5.18.0001"

ID=$(curl --silent \
          ${CURL_AUTH} \
          ${URL}/api/casos/${PROCESSO}/ | jq '.id')

curl --silent \
     --request   DELETE \
     --write-out "\n%{http_code}" \
     ${CURL_AUTH} \
     ${URL}/api/casos/${ID}/

