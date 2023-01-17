*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
Dado ter selecionado um periodo para consultar
    Acionar Filtros
    Informar Período por data    11/01/2023
    Acionar Consultar

E selecionado o primeiro registro retornado
    Selecionar primeiro registro da consulta

E acionado o botão submeter proposta
    Wait Until Element Is Enabled    ${btn_submeter_proposta}    ${IMPLICITY_WAIT}
    Sleep    1s
    Click Element    ${btn_submeter_proposta}

Dado que esteja na tela inicial Detalhamento
    Wait Until Element Is Visible    ${detalhamento_mensagem_inicial}
    ${detalhamento_url}    Get Location
    Should Contain    ${detalhamento_url}    workflow/trace

Quando acionar Filtros
    Acionar Filtros

Quando marcar uma proposta
    Retornar para aba    workflow/trace/detailing/${detalhamento_cod_operacao}/variables
    Wait Until Element Is Visible    ${detalhamento_checkbox_first_variable}
    Click Element    ${detalhamento_checkbox_first_variable}

Quando fizer a busca por uma variável
    Retornar para aba    workflow/trace/detailing/${detalhamento_cod_operacao}/variables
    Wait Until Element Is Visible    ${detalhamento_primeira_variavel}
    ${value}    Get Text    ${detalhamento_primeira_variavel}
    ${caracteres}    Get Substring    ${value}    start=0    end=3
    Set Test Variable    ${Detalhamento_Filtrar_Variaveis}    ${caracteres}
    Input Text    ${detalhamento_filtro_variaveis}    ${caracteres}

E informar um período
    [Arguments]    ${Data Inicial}    ${Data Final}=${None}
    Informar Período por data    ${Data Inicial}    ${Data Final}
    Acionar Consultar

E quando acionar os 3 pontos ao final da primeira proposta
    Wait Until Element Is Visible    ${detalhamento_table_last_td_element}
    Click Element    ${detalhamento_table_last_td_element}

E informar opção "Detalhamento"
    Wait Until Element Is Visible    ${detalhamento_link_opcao_det}
    Click Element    ${detalhamento_link_opcao_det}

E acionar "Geral" no menu lateral
    Retornar para aba    workflow/trace/detailing/${detalhamento_cod_operacao}/variables
    Click Link    ${detalhamento_link_opcao_geral}

E acionar "Fluxo da Política" no menu lateral
    Retornar para aba    workflow/trace/detailing/${detalhamento_cod_operacao}/variables
    Click Link    ${detalhamento_link_opcao_fluxo_da_politica}

E clicar em "Exportar Variáveis"
    Click Button    ${detalhamento_exportar_variaveis}

Então os resultados devem ser filtrados de acordo com o período
    [Arguments]    ${Período}
    ${quantidade_resultados}    SeleniumLibrary.Get Element Count    ${detalhamento_table_resultados}
    Should Not Be Equal As Integers    ${quantidade_resultados}    ${0}

    ${date_hour_table_value}    Get Text    ${detalhamento_table_resultados}/td[5]/span
    ${cod_ope_table_value}    Get Text    ${detalhamento_table_resultados}/td[3]/span

    Should Contain    ${date_hour_table_value}    ${Período}
    Set Test Variable    ${detalhamento_cod_operacao}    ${cod_ope_table_value}

Então devo visualizar o código da operação no cabeçalho da proposta
    Retornar para aba    workflow/trace/detailing/${detalhamento_cod_operacao}/variables
    Element Should Be Visible    xpath://div[text()=' Cód. Operação: ${detalhamento_cod_operacao} ']

Então detalhes do fluxo completo da política é exibido
    Page Should Contain Element    ${detalhamento_flx_politica_canvas}

Então sou redirecionado para uma nova aba contendo as informações gerais da proposta
    ${general_url}    SeleniumLibrary.Get Location
    Should Contain    ${general_url}    ${detalhamento_cod_operacao}/general
    Page Should Contain    Sucesso
    Page Should Contain    Resultado
    Page Should Contain    Processamento
    Page Should Contain    Final
    Page Should Contain    Duração
    Page Should Contain    Filial
    Page Should Contain    Versão da política
    Page Should Contain    Usuário
    Page Should Contain    Versão TXT
    Page Should Contain    Versão XML
    Page Should Contain    IP de origem
    Page Should Contain    IP de servidor

Então o download de um csv contendo as variáveis deve ser concluído
    Verificar se download foi concluído    Variaveis.csv
    ${file}    Get File    ${EXECDIR}/files/downloads/Variaveis.csv

    ${variavel}    Get Text    ${detalhamento_primeira_variavel}
    ${valor_processado}    Get Text    ${detalhamento_valor_processado}

    Should Contain    ${file}    ${variavel}
    Should Contain    ${file}    ${valor_processado}

Então os resultados serão atualizados com os valores correspondentes
    Wait Until Element Is Visible    ${detalhamento_table_variaveis}
    Element Should Contain    ${detalhamento_table_variaveis}    ${Detalhamento_Filtrar_Variaveis}

Então informações de IP de Origem e IP de servidor são exibidas
    Page Should Contain    Sucesso
    Page Should Contain    Resultado
    Page Should Contain    Processamento
    Page Should Contain    Final
    Page Should Contain    Duração
    Page Should Contain    Filial
    Page Should Contain    Versão da política
    Page Should Contain    Usuário
    Page Should Contain    Versão TXT
    Page Should Contain    Versão XML
    Page Should Contain    IP de origem
    Page Should Contain    IP de servidor
