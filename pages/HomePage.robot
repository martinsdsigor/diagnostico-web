*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
Acionar Diagnostico Workflow
    Wait Until Element Is Visible    ${produtos}    ${IMPLICITY_WAIT}
    Click Element    ${home_workflow_diagnostico}
