#!/bin/bash

GRUPO=${1:-*}
export URL=${2:-http://localhost:8081}

function assertEquals() {
    BASE=$(basename ${ARQ} .sh)
    read TESTE <<< ${BASE//_/ }
    read ESPERADO MENSAGEM <<< $(head -n 2 ${ARQ} | tail -n 1 | cut -b 3-)

    [ -z "${USUARIO}"               ] && export CURL_AUTH="" || export CURL_AUTH="--user ${USUARIO}:${SENHA}"
    [ -z "${USUARIO}"               ] && USUARIO="anon"
    [ -z "${ESPERADO}"              ] && ESPERADO=-1
    [ -z "${MENSAGEM}"              ] && MENSAGEM="Teste inválido"
    [ -x ${ARQ}                     ] || MENSAGEM="Teste ${ARQ} inativo."
    [ -x ${ARQ}                     ] && OBTIDO=$(${ARQ} | tail -n 1) || OBTIDO="0"
    [ "${OBTIDO}" -eq "${ESPERADO}" ] && RESULTADO="   OK   " || RESULTADO="${ESPERADO:0:3}->${OBTIDO:0:3}: ${MENSAGEM}"
    [ "${OBTIDO}" -eq "${ESPERADO}" ] && SUCESSO=$(( ${SUCESSO} + 1 )) || FALHA=$(( ${FALHA} + 1 ))

    printf "%7s@%-25s %-8s %-25s [%s]\n" "${USUARIO}" "${BASE:0:25}" "${AREA:0:8}" "${TESTE:0:25}" "${RESULTADO}"
}

printf "%7s@%-25s %-8s %-25s %s\n" "Usuario" "Roteiro" "Area" "Teste" "Resultado"

TESTES=0
SUCESSO=0
FALHA=0
for ARQ in bin/${GRUPO}/*.sh; do
    AREA=$(basename $(dirname ${ARQ}))
    USUARIO="romel" SENHA="123" assertEquals ${ARQ}
#    USUARIO="admin" SENHA="123" assertEquals ${ARQ}
#    USUARIO=""      SENHA=""    assertEquals ${ARQ}
    TESTES=$(( ${TESTES} + 1 ))
done

printf "%4d testes com sucesso (%s%%)\n" ${SUCESSO} $( bc -l <<< "scale=2; ${SUCESSO}/${TESTES}*100" )
printf "%4d testes com falha   (%s%%)\n"   ${FALHA} $( bc -l <<< "scale=2;   ${FALHA}/${TESTES}*100" )
printf "%4d totals\n" ${TESTES}

