*** Settings ***
Documentation       Testes Relacionados ao Requisito DIAG-1665

Resource            ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1665


*** Test Cases ***
Validar download de resultados para testes com status de Finalizado
    [Tags]    diag-1044
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    SUCCEEDED
    E Acionar Consultar
    Então o sistema listará apenas o status    Finalizado
    E acionar a coluna    Enviado / Concluído
    E acionar a coluna    Enviado / Concluído
    E o sistema deve ordernar os resultados    6    decrescente
    E acionar o botão de "Três pontinhos"
    E acionar "Download de resultados"
    E download do arquivo é iniciado e concluído    formato=output

Validar download de resultados para testes com status de Consolidando
    [Tags]    diag-1823
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    CONSOLIDATING
    E Acionar Consultar
    Então o sistema listará apenas o status    Consolidando
    E o botão de três pontinhos estará desabilitado para o status    Consolidando

Validar download de resultados para testes com status de Abortado
    [Tags]    diag-1824
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    ABORTED
    E Acionar Consultar
    Então o sistema listará apenas o status    Abortado
    E o botão de três pontinhos estará desabilitado para o status    Abortado

Validar download de resultados para testes com status de Processando
    [Tags]    diag-1825
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    RUNNING
    E Acionar Consultar
    Então o sistema listará apenas o status    Processando
    E o botão de três pontinhos estará desabilitado para o status    Processando

Validar download de resultados para testes com status de Preparando (Provisionando)
    [Tags]    diag-1826
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    PROVISIONING
    E Acionar Consultar
    Então o sistema listará apenas o status    Provisionando
    E o botão de três pontinhos estará desabilitado para o status    Provisionando

Validar download de resultados para testes com status de Preparando
    [Tags]    diag-1827
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar Período por data    6/02/2023    22/02/2023
    E informar o Status    PREPARING
    E Acionar Consultar
    Então o sistema listará apenas o status    Preparando
    E o botão de três pontinhos estará desabilitado para o status    Preparando
