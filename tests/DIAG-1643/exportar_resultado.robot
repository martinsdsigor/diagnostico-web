*** Settings ***
Documentation    [WKF] Diagnóstico > Detalhamento > Exportar resultado

Resource    ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1643


*** Test Cases ***
Exportar resultados de uma busca
    [Tags]    DIAG-1644
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    3/01/2023
    E acionar EXPORTAR RESULTADOS
    Então os dados exportados para o arquivo CSV devem corresponder aos registros da tabela

Exportar resultados com 20 itens listado por paginação
    [Tags]    DIAG-1835
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    3/01/2023
    DetalhamentoPage.Quando informar a quantidade de propostas    20
    E acionar EXPORTAR RESULTADOS
    Então os dados exportados para o arquivo CSV devem corresponder aos registros da tabela

Exportar resultados com 40 itens listado por paginação
    [Tags]    DIAG-1836
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    3/01/2023
    DetalhamentoPage.Quando informar a quantidade de propostas    40
    E acionar EXPORTAR RESULTADOS
    Então os dados exportados para o arquivo CSV devem corresponder aos registros da tabela

Exportar resultados com 80 itens listado por paginação
    [Tags]    DIAG-1837
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    3/01/2023
    DetalhamentoPage.Quando informar a quantidade de propostas    80
    E acionar EXPORTAR RESULTADOS
    Então os dados exportados para o arquivo CSV devem corresponder aos registros da tabela

Exportar resultados com 100 itens listado por paginação
    [Tags]    DIAG-1838
    Dado que esteja na tela inicial Detalhamento
    Quando acionar Filtros
    E informar um período    27/01/2023
    DetalhamentoPage.Quando informar a quantidade de propostas    100
    E acionar EXPORTAR RESULTADOS
    Então os dados exportados para o arquivo CSV devem corresponder aos registros da tabela
