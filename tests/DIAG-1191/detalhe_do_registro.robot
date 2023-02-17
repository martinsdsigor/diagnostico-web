*** Settings ***
Resource    ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1191


*** Test Cases ***
Detalhamento do Teste: Relatório de cobertura
    [Tags]    DIAG-1046
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Quando acionar os 3 pontos ao final da primeira proposta
    E acionar "Detalhamento do teste"
    Então o sistema exibirá detalhes sobre a submissão

Detalhamento do Teste: Gráficos
    [Tags]    DIAG-1045
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Quando acionar os 3 pontos ao final da primeira proposta
    E acionar "Detalhamento do teste"
    Quando acionar "Gráficos" no menu lateral
    Então o sistema deve exibir os gráficos e dados da duração do teste

Exportar Relatório de cobertura do teste de submissão
    [Tags]    DIAG-1761
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Quando acionar os 3 pontos ao final da primeira proposta
    E acionar "Detalhamento do teste"
    E acionar "Exportar Relatório"
    Então o sistema deve iniciar o download do arquivo

Exportar Gráficos do teste de submissão
    [Tags]    DIAG-1762
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Quando acionar os 3 pontos ao final da primeira proposta
    E acionar "Detalhamento do teste"
    Quando acionar "Gráficos" no menu lateral
    E acionar "Exportar Relatório"
    Então o sistema deve iniciar o download do arquivo
