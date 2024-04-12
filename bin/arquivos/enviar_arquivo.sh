#!/bin/bash
# 200 O envio do arquivo dados/arquivo.png deveria ser permitido.

URL=${URL:-http://localhost:8080}

ARQUIVO=dados/arquivo.png
[ -d ~/Pictures            ] && ORIGEM=$(ls ~/Pictures/*.png | head -n 1)
[ -d ~/Imagens             ] && ORIGEM=$(ls  ~/Imagens/*.png | head -n 1)
[ -d dados                 ] || mkdir dados
[ -d uploads               ] || mkdir uploads
[ -f ${ARQUIVO}            ] || cp "${ORIGEM}" ${ARQUIVO}

curl --silent \
     --write-out "\n%{http_code}" \
     ${CURL_AUTH} \
     --header    "Content-Type: multipart/form-data" \
     --form      "file=@${ARQUIVO}" \
     ${URL}/api/arquivos/upload/

