#!/bin/bash

PROCESSO="0000001-00.2020.5.18.0001"
URL="http://localhost:8081/api/casos/${PROCESSO}"

curl --verbose \
     --request GET \
     --header  "Accept: application/json" \
     --user    "romel:123" \
     ${URL}

