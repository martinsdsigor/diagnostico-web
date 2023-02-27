*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
E informar a politica
    [Arguments]    ${politica}    ${chave}
    
    Wait Until Element Is Enabled    ${label_politica}    ${IMPLICITY_WAIT}
    Click Element    //div[@class="input-box-policy"]/child::app-input-box[1]/div
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
