*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
Acionar Diagnostico Workflow
    Wait Until Element Is Visible    ${produtos}    ${IMPLICITY_WAIT}
    Click Element    ${home_workflow_diagnostico}
    Sleep    1s
    ${modal_feedback_visible}   Run Keyword And Return Status    Element Should Be Visible    ${home_icon_fechar_modal_feedback}
    Run Keyword If    ${modal_feedback_visible}    Click Element    ${home_icon_fechar_modal_feedback}
