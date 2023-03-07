*** Settings ***
Documentation       Testes Relacionados ao Requisito DIAG-901

Resource            ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-901


*** Test Cases ***
Exibir somente política selecionada no filtro
    [Tags]    diag-1224
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar a Política    TESTE_CARGA
    E acionar Consultar
    Então o sistema listará apenas a politica    TESTE_CARGA

Validar Filtro Submissão por ID do teste
    [Tags]    diag-619
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    17/02/2023
    E informar o ID do teste    769031290292617737
    E acionar Consultar
    Então o sistema apresentará o resultado de acordo com ID e o período de teste informados
    ...    id_teste_submissao=769031290292617737
    ...    data_inicial=6/02/2023
    ...    data_final=17/02/2023

Validar Filtro Submissão por ID do teste inexistente
    [Tags]    diag-1803
    Dado que esteja na tela inicial Submissão
    Quando Acionar Filtros
    E Informar Período por data    6/02/2023    17/02/2023
    E Informar o ID do teste    7690312902926
    E Acionar Consultar
    Então é exibido um toast com a mensagem informada    Nenhum teste encontrado!

Validar Filtro Submissão por ID do teste superior à 19 dígitos
    [Tags]    diag-1804
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    6/02/2023    17/02/2023
    E informar o ID do teste    769031290292612344152
    E Acionar Consultar
    Então é exibido um toast com a mensagem informada    Error: 0999 - Erro na requisição.

# Alerta de erro nas propostas que tiveram problemas no DR
#    [Tags]    diag-1229

Validar Filtro Submissão por Status: Finalizado
    [Tags]    diag-1810
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    SUCCEEDED
    E Acionar Consultar
    Então o sistema listará apenas o status    Finalizado

Validar Filtro Submissão por Status: Consolidando
    [Tags]    diag-1811
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    CONSOLIDATING
    E Acionar Consultar
    Então o sistema listará apenas o status    Consolidando

Validar Filtro Submissão por Status: Abortado
    [Tags]    diag-1812
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    ABORTED
    E Acionar Consultar
    Então o sistema listará apenas o status    Abortado

Validar Filtro Submissão por Status: Processando
    [Tags]    diag-1813
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    RUNNING
    E Acionar Consultar
    Então o sistema listará apenas o status    Processando

Validar Filtro Submissão por Status: Preparando
    [Tags]    diag-xxxx
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    PREPARING
    E Acionar Consultar
    Então o sistema listará apenas o status    Preparando

Validar Filtro Submissão por Status : Preparando
    [Tags]    diag-1814
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    PROVISIONING
    E Acionar Consultar
    Então o sistema listará apenas o status    Provisionando

Validar Filtro Submissão por Nome do teste
    [Tags]    diag-1820
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o nome do teste    teste-thamires
    E Acionar Consultar
    Então o sistema listará apenas histórico de testes com o Nome de teste    teste-thamires

Validar Filtro Submissão por Usuário
    [Tags]    diag-1821
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o usuário    Thamires Ramos
    E Acionar Consultar
    Então o sistema listará apenas histórico de testes com o Usuário    Thamires Ramos

Validar Filtro Submissão por Período de datas
    [Tags]    diag-1822
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    27/02/2023
    E Acionar Consultar
    Então o sistema listará apenas histórico de testes com o período de datas informada    6/02/2023    27/02/2023
