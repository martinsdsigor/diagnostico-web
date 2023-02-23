*** Settings ***
Documentation       [WKF] Diagnóstico > Detalhamento > Detalhamento

Resource            ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1233


*** Test Cases ***
Coluna Código de Operação no detalhamento da proposta
    [Tags]    DIAG-1234
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    13/01/2023
    Então os resultados devem ser filtrados de acordo com o período    13/01/2023
    E quando acionar os 3 pontos ao final da primeira proposta
    E informar opção "Detalhamento"
    Então devo visualizar o código da operação no cabeçalho da proposta

Visualizar informações gerais da proposta
    [Tags]    DIAG-405
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    13/01/2023
    Então os resultados devem ser filtrados de acordo com o período    13/01/2023
    E quando acionar os 3 pontos ao final da primeira proposta
    E informar opção "Detalhamento"
    E acionar "Geral" no menu lateral
    Então sou redirecionado para uma nova aba contendo as informações gerais da proposta

Visualizar o fluxo da política
    [Tags]    DIAG-403
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    13/01/2023
    Então os resultados devem ser filtrados de acordo com o período    13/01/2023
    E quando acionar os 3 pontos ao final da primeira proposta
    E informar opção "Detalhamento"
    E acionar "Fluxo da Política" no menu lateral
    Então detalhes do fluxo completo da política é exibido

Exportar variáveis
    [Tags]    DIAG-401
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    13/01/2023
    Então os resultados devem ser filtrados de acordo com o período    13/01/2023
    E quando acionar os 3 pontos ao final da primeira proposta
    E informar opção "Detalhamento"
    Quando marcar uma proposta
    E clicar em "Exportar Variáveis"
    Então o download de um csv contendo as variáveis deve ser concluído

Filtrar variáveis
    [Tags]    DIAG-400
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    13/01/2023
    Então os resultados devem ser filtrados de acordo com o período    13/01/2023
    E quando acionar os 3 pontos ao final da primeira proposta
    E informar opção "Detalhamento"
    Quando fizer a busca por uma variável
    Então os resultados serão atualizados com os valores correspondentes

Validar que detalhamento do registro exibe informações de Ip de Origem e Servidor para conta Neurotech
    [Tags]    DIAG-1626
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    13/01/2023
    Então os resultados devem ser filtrados de acordo com o período    13/01/2023
    E quando acionar os 3 pontos ao final da primeira proposta
    E informar opção "Detalhamento"
    E acionar "Geral" no menu lateral
    Então informações de IP de Origem e IP de servidor são exibidas

Validar que detalhamento do registro não exibe informações de Ip de Origem e Servidor para conta sem ser Neurotech
    [Tags]    DIAG-1627
    Dado ter selecionado a conta    INFRACOMMERCE
    Quando acionar Filtros
    E informar um período    13/01/2023
    Então os resultados devem ser filtrados de acordo com o período    13/01/2023
    E quando acionar os 3 pontos ao final da primeira proposta
    E informar opção "Detalhamento"
    E acionar "Geral" no menu lateral
    Então informações de IP de Origem e IP de servidor não devem ser exibidas
