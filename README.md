# Introdução a Conceitos de Programação em Shell Script (Bash)

Por que programar em Shell?
- Automatização de processos;
- Portabilidade de scripts entre SOs Unix e distribuições Linux;

Um programa em shell (shell script) são arrquivos de texto que são executados linha a linha. Cada comando shell pode ser usado para criação de scripts.

### Escrevendo o primeiro programa em Shell:

Um simples "Hello, world!":
```bash
#!/bin/bash
echo "Ola Mundo!"
```

Para executar esse programa, usamos `./<caminho-do-arquivo>` ou `bash <caminho-do-arquivo>`. 

Pode ser necessário conceder permissão de execução para scripts em shell. Essa permissão é concedida por meio do comando `chmod`:
```bash
chmod +x <nome-do-arquivo-bash>
```
Este comando altera a permissão de arquivos. A flag `+x` indica permissão de *execução*. Mais detalhes sobre o comando podem ser encontradas [aqui](https://www.youtube.com/playlist?list=PL7B7FA4E693D8E790).

## Principais elementos de um programa em Shell

A primeira linha do nosso primeiro programa `!#/bin/bash` especifica o caminho do interpretador. Essa linha garante que o código do script seja portado para outras máquinas pois assegura que o script será executado com o Bash definino no caminho, e não pelo padrão da distribuição.

A segunda linha do programa `echo "ola mundo` executa o [builtin](https://www.youtube.com/playlist?list=PL7B7FA4E693D8E790) **echo** cuja funcionalidade é simplesmente imprimir a variável/string subsequente. Nesse caso, essa linha de código simplesmente imprime "*Ola mundo*" no terminal.

## Variáveis em Shell

Variáveis são importante no desenvolvimento de scripts pois elas contêm dados importantes para o seu funcionamento. A declaração de variáveis em shell deve seguir o seguinte padrão: `NOME_DA_VARIAVEL=<valor-da-variavel>`. Convenciona-se que variáveis sejam escritas em letras maiúsculas e que não tenha nem um espaço entre o nome da variável e o operador de atribuição `=`, bem como entre o operador e o valor da variável.

Para usar o valor das variáveis, usamos o `$` seguido do nome da variável entre chaves (`{}`):
```bash
#!/bin/bash
NOME="Jose
echo "Ola, ${NOME}"
```
O uso da chave assegura que o interpretador condiga identificar corretamente a variável.

Assim como podemos imprimir informações na tela usando o comando `echo`, podemos ler dados do usuário com o comando `read`:

```bash
#!/bin/bash
NOME="Jose"
echo "ola ${NOME}, digite sua idade:"
read IDADE
echo "${NOME}, sua idade e ${IDADE}"
```

Comentários em shell utilizam o `#`. Toda linha que se inicia com um jogo da velha é ignorado pelo interpretador do shell, com excessão do `#!` (shbang).]

## Subshell e substituição de comandos

Quando um script em shell é rodado, ele executa todo o código dentro de sua própria subshell. O código é rodado localmente, em outras palavras, todos os comandos como mudanças de diretório, criação de arquivos é realizada dentro da subshell. Quando o programa termina sua execução, voltamos ao ponto inicial de onde o script foi rodado.

Por exemplo, seja o seguinte script que cria um diretório chamado `/tmp` no caminho `/~`:
```bash
#!/bin/bash

pwd
mkdir tmp
cd tmp
touch arquivo1.txt
pwd
```

Quando executamos esse script, veremos no terminal a impressão do caminho atual, seguida da impressão do mesmo caminho com a adição do diretório `/tmp` no final. Ainda após a execução, perceba que não houve nenhuma mudança de diretório no terminal. Isso é o significado de subshell, a criação de diretório e arquivo no script rodou localmente e não alterou nada no terminal, assim voltamos ao estado inicial de antes da execução.

A **substituição de comandos** é usada quando queremos atribuir ou usar o resultado de um comando em uma variável ou linha de código. Ela é realizada usando o comando entre `$()`. Assim, o resultado do comando retornado pode ser utilizado na atribuição de uma variável ou em um outro comando, por exemplo.

## Argumentos posicionais

A passagem de argumentos é feita na execução do script no terminal. No script, podemos ter quantos argumentos for necessário, mas apenas os primeiros $n$ argumentos passados na execução serão lidos. 

```bash
#!/bin/bash

# Vamos passar alguns argumentos para o nosso script:
echo "esse e o $1 argumento"
echo "esse e o $2 argumento"
```

ao executar esse script:
```
script.sh primeiro segundo terceiro
```
como só usamos 2 argumentos no nosso código, o terceiro argumento não será utilizado.

Podemos obter o número total de argumentos passados para o script com o comando `$#`. Para listar todos os argumentos passados para o scripts usamos o comando `$@`.

### O comando history

Mantêm uma lista dos comandos usados na sessão do terminal. Ele permite o reuso de comandos e é um excelente boost de produtividade!

- Ao digitar `history` no terminal, teremos a lista de todos os comandos utilizados desde o início da sessão atual do terminal.

- Podemos da um "replay" nos últimos $n$ comandos do terminal usando `!n`;

- Quando usado em conjunto com o `grep`, permite econtrar comandos que correspondam a um padrão. Quando usado em conjunto com o `tail`, pode ser usado para encontrar os últimos comandos executados;

Podemos limpar o histórico de uma seção com `history -c`;

Podemos "importar" alguns comandos do histórico direto para um arquivo para a criação de scripts: 

```
history -w >> meu-script.sh
```

## Condicionais if-then-else

Os tipos de blocos condicionais existentes no shell são o `if` comum, `if-else`, `ef-elif-else` e `switch`.

- O bloco de código dentro do `if` é executado apenas se a condição for verdadeira. A sintaxe é a seguinte:
```bash
if [[ ]] #incio do bloco, condição é colocada dentro das chaves
then
    #statement
fi  # fim do bloco
```

- O bloco `if-then-else` executa o bloco de código dentro do `if` caso a condição seja verdadeira. Caso contrário, o bloco de código de código dentro do `else` é executado. A sintaxe é a seguinte:
```bash
if [[ ]]
then    
    #statement if true
else
    #statemente if false
fi #end of if-then-else
```

- Bloco `if-elif-else` é usado para verificar várias condições (mais que duas). A sintaxe é a seguinte:
```bash 
if [[ exp_1 ]]
then 
    #statement if exp_1 is true
elif [[ exp_2 ]]
then 
    #statement if exp_2 is true
else
    #statement if both case_1 and case_2 are false
fi
```

Blocos condicionais também podem ser aninhados, ou seja colocados um dentro do outro:

```bash
if [[ expression ]] 
then
    if [[ nested_expression ]]
    then 
        #statement if nested_expression is true
    else
        #expression if nested_expression is false
    fi #end of inner if-else
else
    #statements if expression is false
fi #end of outter if-else
```

### Operadores condicionais

A verificação de valores ou *Teste* de valores é onde realizamos comparações lógicas de valores no shell. O comando **test** checa o tipo de arquivos e compara valores.

- A comparação entre strings é feita por:
    STRING1 = STRING2 
        as strings são iguais
    STRING1 != STRING2
        as strings não são iguais

- A comparação entre inteiros é feita por:
    - INTEGER1 -eq INTEGER2
        - os inteiros são iguais
    - INTEGER1 -ge INTEGER2
        - INTEGER1 é maior ou igual a INTEGER2
    - INTEGER1 -gt INTEGER2
        - INTEGER é maiorr que INTEGER2
    - INTEGER1 -le INTEGER2
        - INTEGER1 é menor ou igual a INTEGER2
    - INTEGER1 -lt INTEGER2
        - INTEGER1 é menor que INTEGER2