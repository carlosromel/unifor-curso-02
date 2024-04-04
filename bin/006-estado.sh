#!/bin/bash

URL="http://localhost:8081/api/estado"

echo "Pais por país"
curl --silent --header 'Content-Type: application/json' ${URL}/BRA | jq

echo "Pais por UF"
curl --silent --header 'Content-Type: application/json' ${URL}/DF  | jq

echo "Todos os estados"
curl --silent --header 'Content-Type: application/json' ${URL}/    | jq
