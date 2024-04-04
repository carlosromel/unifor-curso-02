#!/bin/bash

URL="http://localhost:8081/api/pais"

echo "Pais por código ISO"
curl --silent --header 'Content-Type: application/json' ${URL}/076 | jq

echo "Pais por código"
curl --silent --header 'Content-Type: application/json' ${URL}/BR  | jq

echo "Pais por sigla"
curl --silent --header 'Content-Type: application/json' ${URL}/BRA | jq

echo "Todos os países"
curl --silent --header 'Content-Type: application/json' ${URL}/    | jq
