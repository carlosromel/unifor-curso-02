#!/bin/bash

URL="http://localhost:8081/api/casos"
PROCESSO="0000022-12.1972.5.18.0001"

function get() {
    ID=$1
    echo "Obtendo o objeto recém ciado (GET)..."
    echo "[${ID}]"
    JSON=$(curl --silent \
                --request GET \
                --header  "Content-Type: application/json" \
                --user    "romel:123" \
                ${URL}/${ID} | jq)
    ID=$(echo ${JSON} | jq ".id")
    echo ${JSON} | jq
    echo "ID: [${ID}]"
}

read -d '' VERB_POST <<HERE
{
  "numeroUnico":  "${PROCESSO}"
, "decisao":      "C"
, "descricao":    "FGTS"
}
HERE

echo "Criando um objeto (POST)..."
ID=$(curl --silent \
          --request POST \
          --header  "Content-Type: application/json" \
          --user    "romel:123" \
          --data    "${VERB_POST}" \
          ${URL}/ | jq ".id")
echo "Objeto criado: ${ID}"
get ${ID}

read -d '' VERB_PATCH <<HERE
{ "id":           ${ID}
, "decisao":      "I"
}
HERE

echo "Atualizando o objeto recém ciado (PATCH)..."
curl --silent \
     --request PATCH \
     --header  "Content-Type: application/json" \
     --user    "romel:123" \
     --data    "${VERB_PATCH}" \
     ${URL}/${ID} | jq

get ${ID}

read -d '' VERB_PUT <<HERE
{
  "id":           ${ID}
, "numeroUnico":  "7654321-99.2024.5.18.9999"
, "decisao":      "C"
, "descricao":    "Ops!"
}
HERE

echo "Substituindo o objeto recém criado (PUT)... #${ID}"
curl --silent \
     --request PUT \
     --header  "Content-Type: application/json" \
     --user    "romel:123" \
     --data    "${VERB_PUT}" \
     ${URL}/${ID} | jq

get ${ID}

echo "Removendo o objeto recém criado (DELETE)... #${ID}"
curl --silent \
     --request DELETE \
     --header  "Content-Type: application/json" \
     --user    "romel:123" \
     ${URL}/${ID}

get ${ID}

