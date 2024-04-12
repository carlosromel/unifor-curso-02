#!/bin/bash
# 201 O caso deveria ter sido aceito.

URL=${URL:-http://localhost:8080}
PROCESSO="0000022-12.1972.5.18.0001"

read -d '' VERB_POST <<HERE
{
  "numeroUnico":  "${PROCESSO}"
, "decisao":      "C"
, "descricao":    "FGTS"
}
HERE

curl --silent \
     --write-out "\n%{http_code}" \
     ${CURL_AUTH} \
     --header    "Content-Type: application/json" \
     --data      "${VERB_POST}" \
     ${URL}/api/casos/

