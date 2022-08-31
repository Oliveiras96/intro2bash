#!/bin/bash

# Inicio do Programa
echo "Bem-vindo ao programa condicional_2"

# Checar se o usuario tem permissao de root:
if [[ ${UID} -eq 0 ]]
then 
    # Executar uma acao de root
    echo "Voce tem permissao root"
    echo "Digite sua idade"

    # Ler a idade do usuario
    read IDADE

    #checar se o usuario e ou nao maior de idade
    if [[ ${IDADE} -ge 18 ]]
    then
        echo "Voce e maior de idade"
        echo "Obrigado por usar o programa"
    else 
        echo "Voce nao e maior de idade"
    fi
else 
    echo "Por favor vire root para executar o programa"
fi