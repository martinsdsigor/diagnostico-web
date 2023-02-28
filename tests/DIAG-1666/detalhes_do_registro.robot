*** Settings ***
Documentation    [WKF] Diagnostico > Detalhamento > Detalhes do registro

Resource    ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1666


*** Test Cases ***
Salvar variáveis no detalhamento do registro sem filtro
    [Tags]    DIAG-1354
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    27/02/2023
    E selecionar um registro
    E acionar a aba 'Variáveis'
    E acionar 'Salvar variáveis'
    Então as informações do registro devem ser exportadas para um arquivo csv    Variaveis.csv

Salvar variáveis no detalhamento do registro filtrando por palavra existente
    [Tags]    DIAG-1355
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    27/02/2023
    E selecionar um registro
    E acionar a aba 'Variáveis'
    E informar uma variável    FLX
    E acionar 'Salvar variáveis'
    Então as informações do registro devem ser exportadas para um arquivo csv    Variaveis.csv

Validar que IP de origem e servidor é exibido para conta neurotech
    [Tags]    DIAG-1621
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    27/02/2023
    E selecionar um registro
    E acionar a aba 'Outras informações'
    Então o sistema exibirá as informações do registro de IP de origem e IP de servidor

Validar que IP de origem e servidor não é exibido para contratante diferente de neurotech
    [Tags]    DIAG-1620
    Dado ter selecionado a conta    BMG
    Quando acionar Filtros
    E informar um período    13/02/2023
    E selecionar um registro
    E acionar a aba 'Outras informações'
    Então o sistema não deverá exibir as informações do registro de IP de origem e IP de servidor

Realizar uma busca ver detalhamento de uma proposta e realizar uma nova busca
    [Tags]    DIAG-1265
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    27/02/2023
    E selecionar um registro
    E acionar a aba 'Outras informações'
    E informar um novo período    24/02/2023
    Então o sistema deverá limpar as informações do quadro de Detalhe do registro

Salvar variáveis no detalhamento do registro filtrando por palavra inexistente
    [Tags]    DIAG-1047
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    27/02/2023
    E selecionar um registro
    E acionar a aba 'Variáveis'
    E informar uma variável    VARIAVEL_INEXISTENTE
    Então o sistema deverá exibir a lista de variáveis em branco
