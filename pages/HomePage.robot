*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
Acionar Diagnostico Workflow
    Wait Until Element Is Visible    ${produtos}    ${IMPLICITY_WAIT}
    Click Element    ${home_workflow_diagnostico}
    ${modal_feedback_visible}   Run Keyword And Return Status    Element Should Be Visible    //mat-icon[text()='close']
    Run Keyword If    ${modal_feedback_visible}    Click Element    //mat-icon[text()='close']
