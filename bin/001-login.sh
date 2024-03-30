#!/bin/bash

URL="http://localhost:8081/realms/SpringBootKeycloak/protocol/openid-connect/token"

curl --silent \
     --request POST \
     --data  "client_id=projeto" \
     --data   "username=romel" \
     --data   "password=aidemim" \
     --data "grant_type=password" \
     ${URL} | jq

