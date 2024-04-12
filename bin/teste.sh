#!/bin/bash

GRUPO=${1:-*}
export URL=${URL:-http://localhost:8081}
TESTE=${2:-*}

function assertEquals() {
    BASE=$(basename ${ARQ} .sh)
    read TESTE <<< ${BASE//_/ }
    read ESPERADO MENSAGEM <<< $(head -n 2 ${ARQ} | tail -n 1 | cut -b 3-)

    [ -z "${ESPERADO}" ] && ESPERADO=-1
    [ -z "${MENSAGEM}" ] && MENSAGEM="Teste inválido"
    [ -x ${ARQ}        ] || MENSAGEM="Teste ${ARQ} inativo."

    printf "%-25s %-8s %-25s" "${BASE:0:25}" "${AREA:0:8}" "${TESTE:0:25}"

    for CREED in ${CREEDS[*]}; do
        read USUARIO SENHA <<< ${CREED/:/ }

        [ -z "${USUARIO}"               ] && export CURL_AUTH=""           || export CURL_AUTH="--user ${USUARIO}:${SENHA}"
        [ -z "${USUARIO}"               ] && USUARIO="anon"
        [ -x ${ARQ}                     ] && OBTIDO=$(${ARQ} | tail -n 1)  || OBTIDO="0"
        [ "${OBTIDO}" -eq "${ESPERADO}" ] && RESULTADO="   OK   "          || RESULTADO="${ESPERADO:0:3}->${OBTIDO:0:3}"
        [ "${OBTIDO}" -eq "${ESPERADO}" ] && SUCESSO=$(( ${SUCESSO} + 1 )) || FALHA=$(( ${FALHA} + 1 ))
        printf " %10s" ${RESULTADO}
    done
    echo
}

CREEDS=("usuario:123" "servidor:123" "magistrado:123" "admin:123")
printf "%-25s %-8s %-25s" "Roteiro" "Area" "Teste"

for CREED in ${CREEDS[*]}; do
    read USUARIO SENHA <<< ${CREED/:/ }
    printf " %10s" ${USUARIO}
done
echo

TESTES=0
SUCESSO=0
FALHA=0
for ARQ in bin/${GRUPO}/${TESTE}.sh; do
    AREA=$(basename $(dirname ${ARQ}))
    assertEquals ${ARQ}
    TESTES=$(( ${TESTES} + ${#CREEDS[*]} ))
done

printf "%4d testes com sucesso (%s%%)\n" ${SUCESSO} $( bc -l <<< "scale=2; ${SUCESSO}/${TESTES}*100" )
printf "%4d testes com falha   (%s%%)\n"   ${FALHA} $( bc -l <<< "scale=2;   ${FALHA}/${TESTES}*100" )
printf "%4d totals\n" ${TESTES}

