#!/bin/bash

URL="http://localhost:8081/api/arquivos/upload/"
ORIGEM=$(ls ~/Pictures/*.png | head -n 1)
DESTINO=dados/amostra.png
REALM=project
U="romel"
P="123"
AUTH=$(echo "$U:$P" | base64)

[ -f ${DESTINO} ] || cp "${ORIGEM}" ${DESTINO}
#     --header "Authorization: ${AUTH}" \

curl --verbose \
     --request POST \
     --basic \
     --user   "$U:$P" \
     --include \
     --header 'Content-Type: application/hal+json' \
     --data   "{'realm':'${REALM}'}" \
     --data   "file=@${DESTINO}" \
     ${URL}

