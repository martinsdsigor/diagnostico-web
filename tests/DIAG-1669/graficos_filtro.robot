*** Settings ***
Documentation       [WKF] Diagnostico > Gráficos > Filtro

Resource            ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1669


*** Test Cases ***
Validar gráficos estatísticos usando filtro de política
    [Tags]    DIAG-1437
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar política    BATCH_TST
    E informar o tipo de gráfico    Distribuição por Políticas
    Então o sistema exibirá o gráfico de acordo com a política    BATCH TST

Validar que apenas conta neurotech consegue visualizar o campo de filtro de IP origem e IP servidor
    [Tags]    DIAG-1634
    Dado ter selecionado a conta    BMG
    Quando acionar Filtros
    Então o sistema não deverá exibir o campo de filtro de IP origem e IP servidor

Validar que conta neurotech consegue visualizar o campo de filtro de IP origem e IP servidor
    [Tags]    DIAG-1635
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    Então o sistema deverá exibir o campo de filtro de IP origem e IP servidor

Validar gráficos estatísticos usando filtro de Campo Período
    [Tags]    DIAG-1048
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um período    1/03/2023
    E informar o tipo de gráfico    Volume de Propostas (Por dia)
    Então o sistema exibirá o gráfico de acordo com o período    01/03/2023

Validar gráficos estatísticos usando filtro de contratante
    [Tags]    DIAG-1309
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um cliente    1
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição de Propostas por Cliente
    Então o sistema exibirá o gráfico de acordo com o cliente    1

Validar gráficos estatísticos usando filtro de Últimos por Período
    [Tags]    DIAG-1857
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar Últimos por Período    ultimos=1    periodo=Horas
    E informar o tipo de gráfico    Taxa de Duração de Propostas
    Então o sistema exibirá o gráfico de acordo com Últimos por Período

Validar gráficos estatísticos usando filtro de Últimas propostas
    [Tags]    DIAG-1858
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar Últimas propostas    10
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por Resultado
    Então o sistema exibirá o gráfico com as últimas propostas    10

Validar gráficos estatísticos usando filtro de Cód. Operação
    [Tags]    DIAG-1859
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar Código Operação    441095910876083857
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por Políticas
    Então o sistema exibirá o gráfico para o tipo    Distribuição por Políticas

Validar gráficos estatísticos usando filtro de Proposta
    [Tags]    DIAG-1860
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar Proposta    12304085253
    E acionar Consultar
    E informar o tipo de gráfico    Taxa de Duração de Propostas
    Então o sistema exibirá o gráfico para o tipo    Taxa de Duração de Propostas

Validar gráficos estatísticos usando filtro de Resultado
    [Tags]    DIAG-1861
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar política    BATCH_TST
    E informar Resultado    APROVADO
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por Resultado
    Então o sistema exibirá o gráfico de acordo com o filtro    Resultado    APROVADO

Validar gráficos estatísticos usando filtro de Sucesso
    [Tags]    DIAG-1862
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar Sucesso    Sim
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por Sucesso
    Então o sistema exibirá o gráfico de acordo com o filtro    Sucesso    Sim

Validar gráficos estatísticos usando filtro de Filial
    [Tags]    DIAG-1863
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar um cliente    1    70    234
    E informar um período    13/02/2023
    E informar Filial    1
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição Filiais
    Então o sistema exibirá o gráfico de acordo com o filtro    Filial    1

Validar gráficos estatísticos usando filtro de Versão da Política
    [Tags]    DIAG-1864
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar Versão da Política    V1.0
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por Versões de Política
    Então o sistema exibirá o gráfico de acordo com o filtro    Versão da Política    V1.0

Validar gráficos estatísticos usando filtro de Mensagem
    [Tags]    DIAG-1865
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar Mensagem    OK
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por Mensagens
    Então o sistema exibirá o gráfico de acordo com o filtro    Mensagem    OK

Validar gráficos estatísticos usando filtro de Usuário
    [Tags]    DIAG-1866
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar Usuário    BatchAdmin
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por Usuários
    Então o sistema exibirá o gráfico de acordo com o filtro    Usuário    BatchAdmin

Validar gráficos estatísticos usando filtro de IP Origem
    [Tags]    DIAG-1867
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar IP Origem    44.192.11.130
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por IP de Origem
    Então o sistema exibirá o gráfico de acordo com o filtro    IP Origem    44.192.11.130

Validar gráficos estatísticos usando filtro de IP Servidor
    [Tags]    DIAG-1868
    Dado que esteja na tela inicial de Gráficos
    Quando acionar Filtros
    E informar IP Servidor    10.122.10.201
    E acionar Consultar
    E informar o tipo de gráfico    Distribuição por IP de Servidor
    Então o sistema exibirá o gráfico de acordo com o filtro    IP Servidor    10.122.10.201
