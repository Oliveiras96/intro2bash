#!/bin/bash

COUNTER=1

while [[ COUNTER -lt 10 ]]
do
    echo "Volta de numero ${COUNTER}"
    ((COUNTER++))
done