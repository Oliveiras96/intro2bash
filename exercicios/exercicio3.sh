#!/bin/bash

#Perguntar se o usuario quer sair do programa
echo "Quer sair do programa? (y/n)"

read ENTRADA

if [[ ${ENTRADA} = "n" ]]
then 
    #Usuario deve entrar com um numero
    echo "Digite um numero:"
    read NUMERO
    if [[ $((NUMERO%2)) -eq 0 ]]
    then
        echo "O numero digitado e par"
    else
        echo "O numero digitado e impar"
    fi
else
    echo "Obrigado por participar"
fi