*** Settings ***

Resource    ../config/mapper.robot

*** Keywords ***
Usuario efetua o login
    Wait Until Element Is Visible       ${txt_email}    ${IMPLICITY_WAIT}
    Input Text      ${txt_email}    igor.santos@ilabqa.com
    Input Text      ${txt_senha}    Igorm@rtins25
    Click Element   ${btn_login}
    Wait Until Page Contains Element    ${txt_bem_vindo}    ${IMPLICITY_WAIT}
    Wait Until Element Is Visible    ${produtos}    ${IMPLICITY_WAIT}
    Usuario realiza screenshot    login
    

