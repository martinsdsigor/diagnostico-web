*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
E informar a politica
    [Arguments]    ${politica}    ${chave}
    
    Wait Until Element Is Enabled    ${label_politica}    ${IMPLICITY_WAIT}
    Click Element    //div[@class="input-box-policy"]/child::app-input-box[1]/div
    Click Element    //*[@class="mat-icon notranslate remove material-icons mat-icon-no-color ng-star-inserted"]
    Input Text    ${input_politica}    ${politica}
    Wait Until Element Is Enabled    //*[text()="${politica}"]/parent::div/parent::div/following-sibling::div/child::div[2]
    Click Element    //*[text()="${politica}"]/parent::div/parent::div/following-sibling::div/child::div[2]

    Click Element    ${input_chave}
    Click Element    //p[text()="${chave}"]


Então é exibido um toast com a mensagem
    [Arguments]    ${mensagem}
    Sleep    2s
    Trocar para aba    https://rsk-neurotools-tst.riskpack.com.br/#/workflow/trace/ressubmission/${detalhamento_cod_operacao}    locator=url
    # Retornar para aba    workflow/trace/submission
    Wait Until Element Is Visible    ${toast}    ${IMPLICITY_WAIT}
    Element Should Contain    ${toast}    ${mensagem}