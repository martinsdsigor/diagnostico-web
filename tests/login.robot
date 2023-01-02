*** Settings ***
Resource    ../config/mapper.robot

Test Setup    Usuario ter acessado o sistema


*** Test Cases ***
Realizar login
    Usuario efetua o login

