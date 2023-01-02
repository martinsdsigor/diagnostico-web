*** Settings ***

Library    SeleniumLibrary

Resource    ./config.robot

*** Keywords ***
Usuario ter acessado o sistema
    Open Browser                ${BASE_URL}       ${BROWSER}
    Set Selenium Implicit Wait  ${IMPLICITY_WAIT}

Usuario realiza screenshot
    [Arguments]    ${page}
    Set Screenshot Directory    ${OUTPUT_DIR}
    Capture Page Screenshot     ${page}.png
