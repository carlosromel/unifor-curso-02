#!/bin/bash

URL="http://localhost:8081/api/casos"
#URL="http://localhost:8081/api/arquivos"
#URL="http://localhost:8081/"

U="romel" P="123" URL="http://localhost:8081/api/casos"
echo "login de usuário: $U (acesso à API ${URL})"
curl --silent \
     --header  "Accept: application/json" \
     --header  "Content-Type: application/json" \
     --user    "$U:$P" \
     ${URL}/1 | jq

U="romel" P="123" URL="http://localhost:8081/api/arquivos"
echo "login de usuário: $U (sem acesso à API ${URL})"
curl --silent \
     --header  "Accept: application/json" \
     --header  "Content-Type: application/json" \
     --user    "$U:$P" \
     ${URL} | jq

U="admin" P="123" URL="http://localhost:8081/api/casos"
echo "login de usuário: $U (sem acesso ao recurso ${URL})"
curl --silent \
     --header  "Accept: application/json" \
     --header  "Content-Type: application/json" \
     --user    "$U:$P" \
     ${URL}/ | jq

