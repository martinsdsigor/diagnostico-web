*** Settings ***
Documentation       Components para funcionalidade Calendário

Resource            ../config/mapper.robot


*** Keywords ***
Informar ano
    [Arguments]    ${year}
    Wait Until Element Is Visible    ${calendar_container}    timeout=${IMPLICITY_WAIT}
    Click Element    ${calendar_dropdown_year}
    Click Element    xpath://span[.='${year}']

Informar mês
    [Arguments]    ${month}
    Evaluate    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')    locale
    ${converted}=    Convert Date    ${month}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    ${month_abbreviation}=    Convert Date    ${converted}    result_format=%b

    Wait Until Element Is Visible    xpath://span[.='${month_abbreviation}.']
    Click Element    xpath://span[.='${month_abbreviation}.']

Informar dia
    [Arguments]    ${day}
    Wait Until Element Is Enabled
    ...    xpath://span[contains(@class, 'owl-dt-calendar-cell-content') and text()='${day}' and not(contains(@class, 'owl-dt-calendar-cell-out'))]
    Click Element
    ...    xpath://span[contains(@class, 'owl-dt-calendar-cell-content') and text()='${day}' and not(contains(@class, 'owl-dt-calendar-cell-out'))]
    ${class}=    SeleniumLibrary.Get Element Attribute
    ...    //span[contains(@class, 'owl-dt-calendar-cell-content') and text()='${day}' and not(contains(@class, 'owl-dt-calendar-cell-out'))]
    ...    class
    Should Contain    ${class}    selected

Acionar Definir
    Wait Until Element Is Visible    ${calendar_button_definir}    ${IMPLICITY_WAIT}
    Click Element    ${calendar_button_definir}
