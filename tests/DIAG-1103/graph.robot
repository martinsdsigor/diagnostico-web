*** Settings ***
Documentation       [WKF] Diagnostico > Graph

Resource            ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1103


*** Test Cases ***
Distribuição por contratante
    [Tags]    DIAG-1120
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Distribuição de Propostas por Cliente
    Então o sistema exibirá o gráfico para o tipo    Distribuição de Propostas por Cliente

Volumetria de propostas (por dia)
    [Tags]    DIAG-1121
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Volume de Propostas (Por dia)
    Então o sistema exibirá o gráfico para o tipo    Volume de Propostas (Por dia)

Volumetria por política (por dia)
    [Tags]    DIAG-1122
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Volume de Propostas por Política (Por dia)
    Então o sistema exibirá o gráfico para o tipo    Volume de Propostas por Política (Por dia)

Volumetria de propostas (por hora)
    [Tags]    DIAG-1123
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Volume de Propostas (Por hora)
    Então o sistema exibirá o gráfico para o tipo    Volume de Propostas (Por hora)

Volumetria de propostas (por minuto)
    [Tags]    DIAG-1124
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Volume de Propostas (Por minuto)
    Então o sistema exibirá o gráfico para o tipo    Volume de Propostas (Por minuto)

Volumetria de propostas (por segundo)
    [Tags]    DIAG-1125
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Volume de Propostas (Por segundo)
    Então o sistema exibirá o gráfico para o tipo    Volume de Propostas (Por segundo)

Volumetria por política (por hora)
    [Tags]    DIAG-1126
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Volume de Propostas por Política (Por hora)
    Então o sistema exibirá o gráfico para o tipo    Volume de Propostas por Política (Por hora)

Volumetria por política (por minuto)
    [Tags]    DIAG-1127
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Volume de Propostas por Política (Por minuto)
    Então o sistema exibirá o gráfico para o tipo    Volume de Propostas por Política (Por minuto)

Volumetria por política (por segundo)
    [Tags]    DIAG-1128
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    27/01/2023
    E informar o tipo de gráfico    Volume de Propostas por Política (Por segundo)
    Então o sistema exibirá o gráfico para o tipo    Volume de Propostas por Política (Por segundo)

Taxa de duração de propostas
    [Tags]    DIAG-1235
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    1/03/2023    hora_inicio=09:08:16    hora_fim=10:08:16
    E informar o tipo de gráfico    Taxa de Duração de Propostas
    Então o sistema exibirá o gráfico para o tipo    Taxa de Duração de Propostas
