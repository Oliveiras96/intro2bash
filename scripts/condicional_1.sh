#!/bin/bash

# Incio do programa
echo "Bem-vindo!"
echo "Digite a sua idade:"

# Ler idade do usuario
read IDADE

# Checar se o usuario e ou nao maior de idade
if [[ ${IDADE} -ge 18 ]]
then 
    echo "Voce e maior de idade"
else 
    echo "Voce nao e maior de idade"
fi