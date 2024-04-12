#!/bin/bash
# 401 O conteúdo não poderia ser acessado sem autenticação.

URL=${URL:-http://localhost:8080}

curl --silent \
     --write-out "\n%{http_code}" \
     --header    "Accept: application/json" \
     ${URL}/api/casos/

