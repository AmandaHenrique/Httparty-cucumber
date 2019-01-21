#language: pt
# encoding: utf-8


Funcionalidade: Realizar um CRUD com sucesso na API de contatos do Batista

Contexto:
    Dado que estou na Api de contatos

@get
Esquema do Cenario:
    Quando eu realizar uma requisicao de consulta na Api com um <id>
    Entao me retonar o codigo <codigo> e a "<mensagem>"

Exemplos:
    |id|codigo|mensagem |
    |35|200   |OK       |
    |36|200   |OK       |
    |37|200   |OK       |
    |2 |404   |Not Found|

@post
Esquema do Cenario:
    Quando eu realizar uma requisição para cadastrar um contato com os parametros "<name>" "<last_name>" "<email>" "<age>" "<phone>" "<address>" "<state>" "<city>"
    Entao me retornar os valores cadastrados com um id
    E me retornar a mensagem "<mensagem>" <codigo>

Exemplos:
    |name  |last_name|email                  |age|phone      |address |state       |city          |mensagem            |codigo|
    |bruno |batista  |novoemail22@hotmail.com|28 |21984759575|Rua dois|Minas Gerais|Belo Horizonte|Created             |201   |
    #|bruno |batista  |novoemail2@hotmail.com |28 |21984759575|Rua dois|Minas Gerais|Belo Horizonte|Unprocessable Entity|422   |


@put
Esquema do Cenario:
    Quando eu realizar uma atualização para o id <id> com os novos valores "<name>" "<address>"
    Entao verificar o <codigo> e a "<mensagem>"
Exemplos:
    |id |name  |address |codigo|mensagem|
    |353|AAAAA |Rua COCO|200   |OK      |


@delete
Esquema do Cenario:
    Quando eu realizar uma requisicao de delete passando o <id>
    E me retornar o <codigo> e "<mensagem>" de sucesso na remocao
    Entao consultar o mesmo <id> para ver se realmente foi deletado
    E obter o resultado <codigo2> "<mensagem2>"

Exemplos: 
    |id |codigo|mensagem  |codigo2|mensagem2|
    |41 |204   |No Content|404    |Not Found|

