#!/bin/bash

#ler o nome do usuario como argumento.

#se o usuario passar dois nomes, os dois devem ser imprimidos
if [[ $# -lt 3 ]]
then 
    if [[ $# -eq 1 ]]
    then
        echo "Ola $1"
    elif [[ $# -eq 2 ]]
    then 
        echo "Ola $1"
        echo "Ola $2"
    fi
else 
    #se o usuario passar mais de dois nomes, imprimir
    echo "Apenas 2 nomes sao permitidos. Tente de novo"
fi