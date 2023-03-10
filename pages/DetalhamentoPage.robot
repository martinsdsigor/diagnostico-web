*** Settings ***
Resource    ../config/mapper.robot


*** Variables ***
@{registros_cod_operacao}


*** Keywords ***
Dado ter selecionado um periodo para consultar
    Acionar Filtros
    Informar Período por data    11/01/2023
    Acionar Consultar

Dado ter selecionado um periodo informando política e resultado
    [Arguments]    ${politica}    ${status}
    Acionar Filtros
    Informar Periodo por
    Informar Política    ${politica}
    Informar Resultado    ${status}
    Acionar Consultar

Quando clicar em
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    //a[text()="${elemento}"]
    Click Element    //a[text()="${elemento}"]

E selecionado o primeiro registro retornado
    Selecionar primeiro registro da consulta
    Retornar codigo da operacao selecionado

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
    Wait Until Page Contains Element    ${detalhamento_tbody_tabela}    limit=${quantidade}    timeout=30s

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
    [Arguments]    ${Data Inicial}    ${Data Final}=${None}    ${hora_inicio}=${None}    ${hora_fim}=${None}
    Informar Período por data    ${Data Inicial}    ${Data Final}    ${hora_inicio}    ${hora_fim}
    Acionar Consultar
    Set Test Variable    ${Data Inicial}
    Set Test Variable    ${Data Final}

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

    ${infracommerce_date_column_visible}    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    ${home_conta_infracommerce}

    IF    ${infracommerce_date_column_visible}
        ${infracommerce_date_column}    Get Text    ${detalhamento_table_resultados}/td[5]/span
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
    hooks.Verificar se download foi concluído    Variaveis.csv
    ${file}    Get File    ${EXECDIR}/files/downloads/Variaveis.csv

    ${variavel}    Get Text    ${detalhamento_primeira_variavel}
    ${valor_processado}    Get Text    ${detalhamento_valor_processado}

    Should Contain    ${file}    ${variavel}
    Should Contain    ${file}    ${valor_processado}


Então o download de um csv contendo as entradas deve ser concluído
    hooks.Verificar se download foi concluído    Entradas.csv

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
    Sleep    500ms
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

E clicar em ressubmeter
    Wait Until Element Is Visible    ${detalhamento_button_ressubmeter}
    Click Element    ${detalhamento_button_ressubmeter}

E informar a politica
    [Arguments]    ${politica}    ${chave}=${None}

    Wait Until Element Is Enabled    ${label_politica}    ${IMPLICITY_WAIT}
    Wait Until Element Is Enabled    //*[@id="mat-checkbox-24"]    ${IMPLICITY_WAIT}
    Click Element    ${label_politica}
    Input Text    ${input_politica}    ${politica}
    Wait Until Element Is Enabled
    ...    //*[text()="${politica}"]/parent::div/parent::div/following-sibling::div/child::div[2]
    Click Element    //*[text()="${politica}"]/parent::div/parent::div/following-sibling::div/child::div[2]

    IF    '${chave}' != '${None}'
        Click Element    ${input_chave}
        Click Element    //p[text()="${chave}"]        
    END


Então o sistema retornará dados relacionados a busca equivalente ao mesmo período
    ${cells}    SeleniumLibrary.Get Element Count    xpath://table/tbody/tr
    FOR    ${counter}    IN RANGE    1    ${cells}
        ${current}    Get Text    xpath://table/tbody/tr[${counter}]/td[5]
        Should Contain    ${current}    ${Data Inicial}
    END

E acionar EXPORTAR RESULTADOS
    Wait Until Element Is Visible    ${detalhamento_button_exportar_resultados}    timeout=20s
    Wait Until Element Is Enabled    ${detalhamento_button_exportar_resultados}    timeout=30s
    Click Button    ${detalhamento_button_exportar_resultados}

Então os dados exportados para o arquivo CSV devem corresponder aos registros da tabela
    ${quantidade_registros}    SeleniumLibrary.Get Element Count    ${detalhamento_table_resultados}
    ${caminho_arquivo_csv}    Join Path    ${EXECDIR}    files    downloads    listaDePropostas.csv
    Wait Until Created    ${caminho_arquivo_csv}
    ${arquivo_csv_em_texto}    Get File    ${caminho_arquivo_csv}

    FOR    ${linha}    IN RANGE    1    ${quantidade_registros+1}    1
        Scroll Element Into View    //table/tbody/tr[${linha}]/td[2]
        FOR    ${coluna}    IN RANGE    2    9    1
            ${conteudo_coluna}    Get Text    //table/tbody/tr[${linha}]/td[${coluna}]

            IF    ${coluna} == ${5}
                ${data_hora}    Get Text    //table/tbody/tr[${linha}]/td[${coluna}]
                ${remove_bolinha_data_hora}    Replace String    ${data_hora}    ${SPACE}•    ${EMPTY}
                ${troca_barra_por_hifen}    Replace String    ${remove_bolinha_data_hora}    /    -
                Should Contain    ${arquivo_csv_em_texto}    ${troca_barra_por_hifen}

                CONTINUE
            END

            Should Contain    ${arquivo_csv_em_texto}    ${conteudo_coluna}
        END
    END

E selecionar um registro
    ${registros}    SeleniumLibrary.Get Element Count    ${detalhamento_tbody_tabela}
    ${numero_aleatorio}    Evaluate    random.randint(1, ${registros})    random
    Scroll Element Into View    //table/tbody/tr[${numero_aleatorio}]/td[2]
    Click Element    //table/tbody/tr[${numero_aleatorio}]/td[2]

E acionar a aba 'Variáveis'
    Wait Until Element Is Visible    ${detalhamento_div_aba_variaveis}
    Wait Until Element Is Enabled    ${detalhamento_div_aba_variaveis}
    Click Element    ${detalhamento_div_aba_variaveis}

E acionar 'Salvar variáveis'
    Wait Until Element Is Visible    ${detalhamento_button_salvar_variaveis}
    Wait Until Element Is Enabled    ${detalhamento_button_salvar_variaveis}
    Click Button    ${detalhamento_button_salvar_variaveis}

Então as informações do registro devem ser exportadas para um arquivo csv
    [Documentation]    Este trecho de código coleta e processa informações sobre variáveis dentro de uma determinada aba.
    ...    Ele segue os seguintes passos:
    ...    1. Identifica a quantidade de resultados dentro da aba de variáveis.
    ...    2. Percorre todos os resultados
    ...    3. Compara os resultados encontrados na interface com os resultados dentro do arquivo csv
    [Arguments]    ${nome_arquivo}

    hooks.Verificar se download foi concluído    ${nome_arquivo}
    ${caminho}    Join Path    files    downloads    ${nome_arquivo}
    ${csv}    Get File    ${caminho}

    ${qtd_variaveis}    SeleniumLibrary.Get Element Count    //app-trace-details-variables/div/div/table/tbody/tr
    FOR    ${linha}    IN RANGE    1    ${qtd_variaveis+1}
        Scroll Element Into View    //app-trace-details-variables/div/div/table/tbody/tr[${linha}]/td[1]
        FOR    ${coluna}    IN RANGE    1    3
            ${conteudo_linha_coluna}    Get Text
            ...    //app-trace-details-variables/div/div/table/tbody/tr[${linha}]/td[${coluna}]
            Should Contain    ${csv}    ${conteudo_linha_coluna}
        END
    END

E informar uma variável
    [Arguments]    ${variavel}
    Input Text    ${detalhamento_input_variaveis}    ${variavel}

E acionar a aba 'Outras informações'
    Wait Until Element Is Visible    ${detalhamento_div_outras_informacoes}
    Wait Until Element Is Enabled    ${detalhamento_div_outras_informacoes}
    Click Element    ${detalhamento_div_outras_informacoes}

Então o sistema exibirá as informações do registro de IP de origem e IP de servidor
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    IP de origem
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    IP de servidor
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Início
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Processamento
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Final
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Duração
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Versão da política
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Mensagem
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Filial
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Usuário
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Versão TXT
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Versão XML

Então o sistema não deverá exibir as informações do registro de IP de origem e IP de servidor
    Element Should Not Contain    ${detalhamento_trace_outras_informacoes}    IP de origem
    Element Should Not Contain    ${detalhamento_trace_outras_informacoes}    IP de servidor
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Início
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Processamento
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Final
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Duração
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Versão da política
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Mensagem
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Filial
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Usuário
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Versão TXT
    Element Should Contain    ${detalhamento_trace_outras_informacoes}    Versão XML

Então o sistema deverá exibir a lista de variáveis em branco
    ${registros}    SeleniumLibrary.Get Element Count    ${detalhamento_table_detalhes_variaveis}
    Should Be Equal As Integers    ${registros}    ${0}

E informar um novo período
    [Arguments]    ${periodo}
    E informar um período    ${periodo}

Então o sistema deverá limpar as informações do quadro de Detalhe do registro
    Element Should Be Visible    ${detalhamento_trace_background_message}
    Page Should Not Contain Element    ${detalhamento_trace_outras_informacoes}
