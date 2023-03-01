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

Informar Hora Inicial
    [Arguments]    ${hora_inicio}=${None}
    IF    '${hora_inicio}' != '${None}'
        ${separa_hora_minuto_segundo}=    Split String    ${hora_inicio}    :
        Clear Element Text    //span[text()='Hour']/preceding-sibling::input
        Input Text    //span[text()='Hour']/preceding-sibling::input    ${separa_hora_minuto_segundo}[0]
        Press Keys    //span[text()='Hour']/preceding-sibling::input    RETURN

        Clear Element Text    //span[text()='Minute']/preceding-sibling::input
        Input Text    //span[text()='Minute']/preceding-sibling::input    ${separa_hora_minuto_segundo}[1]
        Press Keys    //span[text()='Minute']/preceding-sibling::input    RETURN

        Clear Element Text    //span[text()='Second']/preceding-sibling::input
        Input Text    //span[text()='Second']/preceding-sibling::input    ${separa_hora_minuto_segundo}[2]
        Press Keys    //span[text()='Second']/preceding-sibling::input    RETURN
    END

Informar Hora Fim
    [Arguments]    ${hora_fim}=${None}
    IF    '${hora_fim}' != '${None}'
        Wait Until Element Is Visible    //span[text()='Fim:']/parent::span
        Wait Until Element Is Enabled    //span[text()='Fim:']/parent::span
        Click Element    //span[text()='Fim:']/parent::span
        ${separa_hora_minuto_segundo}=    Split String    ${hora_fim}    :
        Clear Element Text    //span[text()='Hour']/preceding-sibling::input
        Input Text    //span[text()='Hour']/preceding-sibling::input    ${separa_hora_minuto_segundo}[0]
        Press Keys    //span[text()='Hour']/preceding-sibling::input    RETURN

        Clear Element Text    //span[text()='Minute']/preceding-sibling::input
        Input Text    //span[text()='Minute']/preceding-sibling::input    ${separa_hora_minuto_segundo}[1]
        Press Keys    //span[text()='Minute']/preceding-sibling::input    RETURN

        Clear Element Text    //span[text()='Second']/preceding-sibling::input
        Input Text    //span[text()='Second']/preceding-sibling::input    ${separa_hora_minuto_segundo}[2]
        Press Keys    //span[text()='Second']/preceding-sibling::input    RETURN
    END

Acionar Definir
    Wait Until Element Is Visible    ${calendar_button_definir}    ${IMPLICITY_WAIT}
    Click Element    ${calendar_button_definir}
