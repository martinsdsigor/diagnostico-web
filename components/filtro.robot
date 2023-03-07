*** Settings ***
Documentation       Components para funcionalidade Filtro

Resource            ../config/mapper.robot


*** Keywords ***
Acionar Filtros
    Wait Until Element Is Visible    ${filtro_button_filtros}
    Click Element    ${filtro_button_filtros}

Informar Cliente
    [Arguments]    @{cliente}
    Wait Until Element Is Visible    ${filtro_select_contratante}
    Click Element    ${filtro_select_contratante}

    FOR    ${element}    IN    @{cliente}
        ${class}    SeleniumLibrary.Get Element Attribute
        ...    //span[.='Cliente']/parent::div/parent::div/following::div/div/div/mat-checkbox[contains(.,' ${element} ')]
        ...    class
        ${is_checked}    Run Keyword And Return Status    Should Contain    ${class}    mat-checkbox-checked

        IF    ${is_checked} != True
            Click Element
            ...    xpath://span[.='Cliente']/parent::div/parent::div/following::div/div/div/mat-checkbox[contains(.,' ${element} ')]
        END
    END


Informar Período por data
    [Arguments]    ${Data_Inicial}    ${Data_Final}=${None}    ${hora_inicio}=${None}    ${hora_fim}=${None}
    @{start_date_splitted}    Split String    ${Data_Inicial}    separator=/

    Click Element    ${filtro_periodo}
    Wait Until Element Is Enabled    ${calendar_input_start_date}
    Sleep    1s
    Click Element    ${calendar_input_start_date}

    Informar ano    ${start_date_splitted}[2]
    Informar mês    ${Data_Inicial}
    Informar dia    ${start_date_splitted}[0]
    Informar Hora Inicial    ${hora_inicio}
    Informar Hora Fim    ${hora_fim}

    IF    '${Data_Final}' != '${None}'
        @{end_date_splitted}    Split String    ${Data_Final}    separator=/
        Informar ano    ${end_date_splitted}[2]
        Informar mês    ${Data_Final}
        Informar dia    ${end_date_splitted}[0]
        Informar Hora Inicial    ${hora_inicio}
        Informar Hora Fim    ${hora_fim}
        Acionar Definir
    ELSE
        Acionar Definir
    END

Informar Periodo por
    [Arguments]    ${Ultimos}=1    ${Periodo}=Dias

    Wait Until Element Is Enabled    ${filtro_input_ultimos_periodo}    timeout=${IMPLICITY_WAIT}
    Input Text    ${filtro_input_ultimos_periodo}    ${Ultimos}
    Click Element    ${filtro_select_ultimos_periodo}
    Click Element
    ...    //div[contains(@role, 'listbox')]/*[.=' ${Periodo} ']

Informar Últimas propostas
    [Arguments]    ${Quantidade}
    Wait Until Element Is Enabled    ${filtro_input_ultimas_propostas}
    Input Text    ${filtro_input_ultimas_propostas}    ${Quantidade}

Informar Cód. Operação
    [Arguments]    ${Código}
    Wait Until Element Is Enabled    ${filtro_input_codigo_operacao}
    Input Text    ${filtro_input_codigo_operacao}    ${Código}

Informar Proposta
    [Arguments]    ${Proposta}
    Wait Until Element Is Enabled    ${filtro_input_proposta}
    Input Text    ${filtro_input_proposta}    ${Proposta}

Informar Política
    [Arguments]    ${Política}
    Wait Until Element Is Enabled    ${filtro_select_politica}
    Click Element    ${filtro_select_politica}
    Input Text    ${filtro_politica_search_box}    ${Política}
    Click Element
    ...    xpath://p[contains(text(), '${Política}')]/parent::div/parent::div/following::div[3][not(contains(@class, 'disabled'))]

Informar Resultado
    [Arguments]    ${Resultado}
    Wait Until Element Is Enabled    ${filtro_select_resultado}
    Click Element    ${filtro_select_resultado}
    Input Text    ${filtro_resultado_search_box}    ${Resultado}
    Click Element
    ...    xpath://p[contains(text(), '${Resultado}')]/parent::div/parent::div/following::div[3][not(contains(@class, 'disabled'))]

Informar Sucesso
    [Arguments]    ${Sucesso}
    Wait Until Element Is Enabled    ${filtro_select_sucesso}
    Scroll Element Into View    ${filtro_select_sucesso}
    Click Element    ${filtro_select_sucesso}
    Input Text    ${filtro_sucesso_search_box}    ${Sucesso}
    Click Element
    ...    xpath://span[.='Sucesso']/parent::div/parent::div/following::div/div[2]/div/p[.='${Sucesso}']

Informar Filial
    [Arguments]    ${Filial}
    Wait Until Element Is Enabled    ${filtro_input_filial}
    Input Text    ${filtro_input_filial}    ${Filial}

Informar Versão da Política
    [Arguments]    ${Versão_da_política}
    Wait Until Element Is Enabled    ${filtro_input_versao_da_politica}
    Input Text    ${filtro_input_versao_da_politica}    ${Versão_da_política}

Informar Mensagem
    [Arguments]    ${Mensagem}
    Wait Until Element Is Enabled    ${filtro_input_mensagem}
    Input Text    ${filtro_input_mensagem}    ${Mensagem}

Informar Usuário
    [Arguments]    ${Usuário}
    Wait Until Element Is Enabled    ${filtro_input_usuario}
    Input Text    ${filtro_input_usuario}    ${Usuário}

Informar ID do Lote
    [Arguments]    ${ID_Lote}
    Wait Until Element Is Enabled    ${filtro_input_id_lote}
    Input Text    ${filtro_input_id_lote}    ${ID_Lote}

Informar IP Origem
    [Arguments]    ${IP_Origem}
    Wait Until Element Is Enabled    ${filtro_input_ip_origem}
    Scroll Element Into View    ${filtro_input_ip_servidor}
    Input Text    ${filtro_input_ip_origem}    ${IP_Origem}

Informar IP Servidor
    [Arguments]    ${IP_Servidor}
    Wait Until Element Is Enabled    ${filtro_input_ip_servidor}
    Scroll Element Into View    ${filtro_input_ip_servidor}
    Input Text    ${filtro_input_ip_servidor}    ${IP_Servidor}

Acionar Consultar
    Wait Until Element Is Enabled    ${filtro_button_consultar}
    Click Button    ${filtro_button_consultar}

Fechar filtro
    Wait Until Element Is Visible    ${filtro_icone_voltar}
    Click Element    ${filtro_icone_voltar}
