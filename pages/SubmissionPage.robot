*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
E informar a politica
    [Arguments]    ${politica}    ${chave}

    Wait Until Element Is Enabled    ${label_politica}    ${IMPLICITY_WAIT}
    Click Element    ${label_politica}
    Input Text    ${input_politica}    ${politica}
    Wait Until Element Is Enabled    //*[text()="${politica}"]/parent::div/parent::div/following-sibling::div/child::div[2]
    Click Element    //*[text()="${politica}"]/parent::div/parent::div/following-sibling::div/child::div[2]

    Click Element    ${input_chave}
    Click Element    //p[text()="${chave}"]

Quando fizer o upload do arquivo
    [Arguments]    ${file_name}

    Wait Until Element Is Enabled    ${input_importar_csv}
    ${file_extension}    Split String    ${file_name}    separator=.

    Choose File    ${input_importar_csv}    ${EXECDIR}/files/uploads/${file_name}

    IF    '${file_extension[1]}' == csv
        ${size}    Get File Size    ${EXECDIR}/files/uploads/${file_name}

        IF    '${size}' > '0'
            ${span_file}    Get WebElement    //span[text()="Arquivo Importado: ${file_name}"]
            Element Should Contain    ${span_file}    Arquivo Importado: ${file_name}
        END
    END

Então é exibido um toast com a mensagem
    [Arguments]    ${mensagem}
    Sleep    2s
    Trocar para aba    https://rsk-neurotools-tst.riskpack.com.br/#/workflow/trace/submission    locator=url
    # Retornar para aba    workflow/trace/submission
    Wait Until Element Is Visible    ${toast}    ${IMPLICITY_WAIT}
    Element Should Contain    ${toast}    ${mensagem}

E modificar os valores da proposta
    [Arguments]    ${entrada}    ${valor}
    Wait Until Element Is Visible    //div[text()="${entrada}"]/parent::div/following-sibling::div/input
    Input Text    //div[text()="${entrada}"]/parent::div/following-sibling::div/input    ${valor}

Quando adicionar uma nova entrada
    [Arguments]    ${entrada}
    Wait Until Element Is Enabled    //div[text()="PROP_NOME"]/parent::div/following-sibling::div/input
    Click Element    ${btn_adicionar}
    Input Text    ${input_ultima_entrada}    ${entrada}

Quando remover uma entrada
    [Arguments]    ${entrada}
    Wait Until Element Is Enabled    //div[text()="${entrada}"]/parent::div/following-sibling::div/input
    Click Element    //div[text()="${entrada}"]/parent::div/preceding-sibling::div/mat-checkbox
    Click Element    ${btn_remover}

Dado que esteja na tela inicial Submissão
    Acionar Submissão
    Wait Until Element Is Visible    xpath://i[.=' close ']
    ${toast_visible}    Run Keyword And Return Status    Element Should Be Visible    xpath://i[.=' close ']
    IF    ${toast_visible}    Click Element    xpath://i[.=' close ']
    Element Should Be Visible    xpath://h3[text()='Nenhum teste encontrado com os parâmetros de busca informados.']

Então o sistema deve ordernar os resultados
    [Arguments]    ${coluna}    ${ordem}=crescente
    Sleep    1s
    ${cells}    SeleniumLibrary.Get Element Count    xpath://table/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${cells}    3
        ${next_row_exists}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath://table/tbody/tr[${counter+3}]/td[${coluna}]
        IF    ${next_row_exists} == ${False}            BREAK

        ${current}    Get Text    xpath://table/tbody/tr[${counter}]/td[${coluna}]
        ${next}    Get Text    xpath://table/tbody/tr[${counter+3}]/td[${coluna}]

        IF    '${ordem}' == 'crescente'
            IF    '${current}' < '${next}'    RETURN
        ELSE IF    '${ordem}' == 'decrescente'
            IF    '${current}' > '${next}'    RETURN
        END
    END

Quando informar a quantidade de propostas
    [Arguments]    ${quantidade}
    Wait Until Element Is Visible    ${submissao_texto_itens_por_pagina}
    Scroll Element Into View    ${submissao_texto_itens_por_pagina}
    Click Element    ${submissao_select_itens_por_pagina}
    Wait Until Element Is Visible    xpath://mat-option[@role='option']/span[text()=' ${quantidade} ']
    Click Element    xpath://mat-option[@role='option']/span[text()=' ${quantidade} ']

Quando acionar os 3 pontos ao final da primeira proposta
    Wait Until Element Is Visible    //table/tbody/tr[1]/td[9]
    Click Element    //table/tbody/tr[1]/td[9]
    ${id_do_teste}    SeleniumLibrary.Get Text    //table/tbody/tr[1]/td[3]
    ${politica_do_teste}    SeleniumLibrary.Get Text    //table/tbody/tr[1]/td[5]
    ${nome_do_teste}    SeleniumLibrary.Get Text    //table/tbody/tr[1]/td[2]
    Set Test Variable    ${submissao_id_do_teste}    ${id_do_teste}
    Set Test Variable    ${submissao_politica}    ${politica_do_teste}
    Set Test Variable    ${submissao_nome}    ${nome_do_teste}

E acionar "Detalhamento do teste"
    Wait Until Element Is Visible    //div[@id='mat-menu-panel-2']
    Click Element    //button[.=' Detalhamento do teste ']

Quando acionar "Gráficos" no menu lateral
    Wait Until Element Is Enabled    //span[text()='Gráficos ']/parent::a
    Click Element    //span[text()='Gráficos ']/parent::a

E acionar "Exportar Relatório"
    Wait Until Element Is Visible    ${submissao_botao_exportar_relatorio}
    Click Button    ${submissao_botao_exportar_relatorio}

Então o sistema deve iniciar o download do arquivo
    [Arguments]    ${extensao_arquivo}=pdf
    ${nome_do_teste_uppercase}    Convert To Upper Case    ${submissao_nome}
    Verificar se download foi concluído    filename=Report_${nome_do_teste_uppercase}.${extensao_arquivo}

Então o sistema deve exibir os gráficos e dados da duração do teste
    Page Should Contain    ${submissao_nome}
    Page Should Contain    ${submissao_id_do_teste}
    Page Should Contain    ${submissao_politica}
    Page Should Contain    Gráfico da Execução
    Page Should Contain    Gráfico do resultado
    Page Should Contain    Dados da duração do teste
    Page Should Contain    Tempo máximo
    Page Should Contain    Tempo médio
    Page Should Contain    Tempo mínimo
    Page Should Contain    Desvio Padrão
    Page Should Contain    Tempo Total de processamento
    Page Should Contain    Quantidade total de proposta

Então o sistema exibirá detalhes sobre a submissão
    Page Should Contain    ${submissao_nome}
    Page Should Contain    ${submissao_id_do_teste}
    Page Should Contain    ${submissao_politica}
