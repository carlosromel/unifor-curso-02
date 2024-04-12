#!/bin/bash
# 200 A obtenção do arquivo amostra.png deveria ser permitido.

URL=${URL:-http://localhost:8080}

DESTINO=dados/arquivo.png
[ -d ~/Pictures            ] && ORIGEM=$(ls ~/Pictures/*.png | head -n 1)
[ -d ~/Imagens             ] && ORIGEM=$(ls  ~/Imagens/*.png | head -n 1)
[ -d dados                 ] || mkdir dados
[ -d downloads             ] || mkdir downloads
[ -f ${DESTINO}            ] || cp "${ORIGEM}" ${DESTINO}
[ -f downloads/amostra.png ] || cp ${DESTINO} downloads/amostra.png

curl --silent \
     --write-out "\n%{http_code}" \
     ${CURL_AUTH} \
     --output dados/arquivo.png \
     ${URL}/api/arquivos/download/avatar.png

