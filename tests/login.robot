*** Settings ***
Resource    ../config/mapper.robot

Test Setup    Usuario ter acessado o sistema


*** Test Cases ***
Cenário: Login realizado com sucesso
    Usuario efetua o login

