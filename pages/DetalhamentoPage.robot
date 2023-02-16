*** Settings ***
Resource    ../config/mapper.robot


*** Variables ***
@{registros_cod_operacao}


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

Quando acionar a coluna
    [Arguments]    ${column}
    Wait Until Element Is Visible    xpath://table/thead/tr/th[.=' ${column} ']
    Click Element    xpath://table/thead/tr/th[.=' ${column} ']

Quando acionar botão
    [Arguments]    ${button_label}
    Wait Until Element Is Visible    xpath://button[@aria-label='${button_label}']
    Click Button    xpath://button[@aria-label='${button_label}']

Quando informar a quantidade de propostas
    [Arguments]    ${quantidade}
    Element Should Be Visible    ${detalhamento_select_paginacao}
    Scroll Element Into View    ${detalhamento_select_paginacao}
    Click Element    ${detalhamento_select_paginacao}
    Wait Until Element Is Visible    xpath://mat-option[@role='option']/span[text()=' ${quantidade} ']
    Click Element    xpath://mat-option[@role='option']/span[text()=' ${quantidade} ']

Quando acionar o checkbox do registro
    [Arguments]    @{linha}
    FOR    ${counter}    IN    @{linha}
        Element Should Be Visible    xpath://table/tbody/tr[${counter}]/td[1]/mat-checkbox
        Click Element    xpath://table/tbody/tr[${counter}]/td[1]/mat-checkbox
        ${checked}    SeleniumLibrary.Get Element Attribute
        ...    xpath://table/tbody/tr[${counter}]/td[1]/mat-checkbox
        ...    class
        ${cod_ope}    SeleniumLibrary.Get Text    xpath://table/tbody/tr[${counter}]/td[3]/span
        Append To List    ${registros_cod_operacao}    ${cod_ope}
        Should Contain    ${checked}    mat-checkbox-checked
    END
    Set Test Variable    @{registros_cod_operacao}

Quando acionar "Painel"
    Element Should Be Visible    ${detalhamento_button_painel}
    Click Button    ${detalhamento_button_painel}

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

E visualizar a mensagem "Abra os filtros e faça uma busca."
    Element Should Be Visible    ${detalhamento_mensagem_inicial}
    Page Should Contain Element    ${detalhamento_mensagem_inicial}

E Cód. Operação deve estar visivel como terceira coluna
    Element Should Be Visible    ${detalhamento_table_cod_operacao}
    Page Should Contain Element    ${detalhamento_table_cod_operacao}

E exibir uma seta apontada para cima próximo ao nome
    [Arguments]    ${column}
    Wait Until Element is Visible    xpath://div[.=' ${column} ']/following-sibling::div
    ${atributos}    SeleniumLibrary.Get Element Attribute
    ...    xpath://div[.=' ${column} ']/following-sibling::div
    ...    style
    ${ordem}    SeleniumLibrary.Get Element Attribute    xpath://div[.=' ${column} ']/parent::th    aria-sort
    Should Be Equal As Strings    ${ordem}    ascending
    Should Contain    ${atributos}    opacity: 1

E exibir uma seta apontada para baixo próximo ao nome
    [Arguments]    ${column}
    Wait Until Element is Visible    xpath://div[.=' ${column} ']/following-sibling::div
    ${atributos}    SeleniumLibrary.Get Element Attribute
    ...    xpath://div[.=' ${column} ']/following-sibling::div
    ...    style
    ${ordem}    SeleniumLibrary.Get Element Attribute    xpath://div[.=' ${column} ']/parent::th    aria-sort
    Should Be Equal As Strings    ${ordem}    descending
    Should Contain    ${atributos}    opacity: 1;

E não exibirá uma seta ao lado do nome
    [Arguments]    ${column}
    Element Should Not Be Visible    xpath://div[.=' ${column} ']/following-sibling::div
    ${atributos}    SeleniumLibrary.Get Element Attribute
    ...    xpath://div[.=' ${column} ']/following-sibling::div
    ...    style
    ${ordem}    SeleniumLibrary.Get Element Attribute    xpath://div[.=' ${column} ']/parent::th    aria-sort
    Should Be Equal As Strings    ${ordem}    none
    Should Contain    ${atributos}    opacity: 0;

E indicador de quantidade deve exibir
    [Arguments]    ${mensagem}
    ${valor}    SeleniumLibrary.Get Text    xpath://span[@class='select-count ng-star-inserted']
    Should Be Equal    ${valor}    ${mensagem}

E botão "Ressubmeter" desabilitado
    Wait Until Element Is Visible    ${detalhamento_button_ressubmeter}
    Element Should Be Disabled    ${detalhamento_button_ressubmeter}

Então os resultados devem ser filtrados de acordo com o período
    [Arguments]    ${Período}
    ${quantidade_resultados}    SeleniumLibrary.Get Element Count    ${detalhamento_table_resultados}
    Should Not Be Equal As Integers    ${quantidade_resultados}    ${0}


    ${infracommerce_date_column_visible}    Run Keyword And Return Status    Element Should Be Visible    ${home_conta_infracommerce}


    IF    ${infracommerce_date_column_visible}
         ${infracommerce_date_column}   Get Text    ${detalhamento_table_resultados}/td[5]/span
         Should Contain    ${infracommerce_date_column}    ${Período}
         ${cod_ope_table_value}    Get Text    ${detalhamento_table_resultados}/td[2]/span
         Set Test Variable    ${detalhamento_cod_operacao}    ${cod_ope_table_value}

    ELSE
        ${neurotech_date_column}    Get Text    ${detalhamento_table_resultados}/td[5]/span
        Should Contain    ${neurotech_date_column}    ${Período}
        ${cod_ope_table_value}    Get Text    ${detalhamento_table_resultados}/td[3]/span
        Set Test Variable    ${detalhamento_cod_operacao}    ${cod_ope_table_value}
    END

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

Então o sistema deve ordernar os resultados
    [Arguments]    ${coluna}    ${ordem}=crescente
    Sleep    3s
    # Pega a quantidade de linhas visíveis da tabela, por ex: 20
    ${cells}    SeleniumLibrary.Get Element Count    xpath://table/tbody/tr/td[${coluna}]
    FOR    ${counter}    IN RANGE    1    ${cells}
        # Pega o texto do elemento na posição counter, por ex: 1
        ${current}    Get Text    xpath://table/tbody/tr[${counter}]/td[${coluna}]
        # Pega o texto do elemento seguinte a posição do counter, por ex: 2
        ${next}    Get Text    xpath://table/tbody/tr[${counter+1}]/td[${coluna}]

        IF    '${ordem}' == 'crescente'
            # Verifica se o valor atual é menor que o próximo valor
            IF    '${current}' < '${next}'    RETURN
        ELSE IF    '${ordem}' == 'decrescente'
            IF    '${current}' > '${next}'    RETURN
        END
    END

Então o sistema ordenará por Data mais recente
    Sleep    3s
    # Pega a quantidade de linhas visíveis da tabela, por ex: 20
    ${cells}    SeleniumLibrary.Get Element Count    xpath://table/tbody/tr/td[5]
    FOR    ${counter}    IN RANGE    1    ${cells}
        # Pega o texto do elemento na posição counter, por ex: 1
        ${current}    Get Text    xpath://table/tbody/tr[${counter}]/td[5]
        # Pega o texto do elemento seguinte a posição do counter, por ex: 2
        ${next}    Get Text    xpath://table/tbody/tr[${counter+1}]/td[5]
        # Valida se a linha atual é menor que a próxima linha
        IF    '${current}' < '${next}'    RETURN
    END

Então deve ser exibida a última página de resultados da busca
    ${disabled}    SeleniumLibrary.Get Element Attribute    ${detalhamento_button_ultima_pagina}    disabled
    Should Be Equal    true    ${disabled}
    Element Should Be Disabled    ${detalhamento_button_ultima_pagina}

Então a quantidade de propostas deve ser igual a
    [Arguments]    ${quantidade}
    Wait Until Element Is Visible
    ...    xpath://div[@class='mat-paginator-range-label' and contains(text(), '${quantidade}')]
    Scroll Element Into View    xpath://div[@class='mat-paginator-range-label' and contains(text(), '${quantidade}')]
    ${valor}    SeleniumLibrary.Get Text
    ...    xpath://div[@class='mat-paginator-range-label' and contains(text(), '${quantidade}')]
    Should Contain    ${valor}    ${quantidade}

Então botões "Ressubmeter" e "Painel" são habilitados
    Element Should Be Visible    ${detalhamento_button_ressubmeter}
    Element Should Be Visible    ${detalhamento_button_painel}

Então o sistema redireciona para uma nova aba, exibindo os resultados do registro selecionado
    Trocar para aba    Painel de Regras
    FOR    ${cod_operacao}    IN    @{registros_cod_operacao}
        Page Should Contain    ${cod_operacao}
    END

Então os botões "Primeira página" e "Voltar página" ficarão habilitados
    Element Should Be Enabled    ${detalhamento_button_pagina_anterior}
    Element Should Be Enabled    ${detalhamento_button_primeira_pagina}

Então informações de IP de Origem e IP de servidor não devem ser exibidas
    Page Should Not Contain    IP de origem
    Page Should Not Contain    IP de servidor
