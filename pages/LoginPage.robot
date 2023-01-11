*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
Informar as credenciais de acesso
    [Arguments]    ${user}    ${pass}
    Wait Until Element Is Visible    ${txt_email}    ${IMPLICITY_WAIT}
    Input Text    ${txt_email}    ${user}
    Input Text    ${txt_senha}    ${pass}
    Click Element    ${btn_login}

Então a página com os produtos riskpack é visualizada
    Wait Until Page Contains Element    ${txt_bem_vindo}    ${IMPLICITY_WAIT}
    Wait Until Element Is Visible    ${produtos}    ${IMPLICITY_WAIT}
