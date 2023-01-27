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

    Choose File    ${input_importar_csv}    ${EXECDIR}/files/${file_name}

    IF    '${file_extension[1]}' == csv

        ${size}    Get File Size    ${EXECDIR}/files/${file_name}

        IF    '${size}' > '0'
            ${span_file}    Get WebElement    //span[text()="Arquivo Importado: ${file_name}"]
            Element Should Contain    ${span_file}    Arquivo Importado: ${file_name}
        END

    END

Então é exibido um toast com a mensagem
    [Arguments]    ${mensagem}
    Sleep    2s
    Trocar para aba   https://rsk-neurotools-tst.riskpack.com.br/#/workflow/trace/submission    locator=url
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
