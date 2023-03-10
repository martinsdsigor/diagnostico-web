*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
Dado ter selecionado um periodo para consultar
    Acionar Gráficos
    Acionar Filtros
    Informar Período por data    11/01/2023
    Acionar Consultar

Quando selecionar um periodo para consultar
    Acionar Gráficos
    Acionar Filtros
    Informar Período por data    11/01/2023
    Acionar Consultar

Quando selecionar o tipo de grafico para download
    [Arguments]    ${grafico}

    Wait Until Element Is Enabled    ${tipo_de_grafico}
    Click Element    ${tipo_de_grafico}
    Sleep    1s
    Click Element    //div[@role="listbox"]/child::mat-option/span[text()="${grafico}"]

    Click Element    //button[text()="ADICIONAR"]
    Click Element    ${btn_download}

Então o arquivo com o nome do gráfico é salvo com sucesso
    [Arguments]    ${arquivo}
    Sleep    3s
    ${arquivos_no_diretorio}    List Files In Directory    ${EXECDIR}/files/downloads

    Log To Console    ${arquivos_no_diretorio} encontrado no diretório /files/downloads

    List Should Contain Value    ${arquivos_no_diretorio}    ${arquivo}

Então é exibido na lista o gráfico
    [Arguments]    ${grafico}

    Wait Until Element Is Enabled    ${tipo_de_grafico}
    Click Element    ${tipo_de_grafico}
    Sleep    1s
    Scroll Element Into View    //div[@role="listbox"]/child::mat-option/span[text()="${grafico}"]
    Element Should Be Visible    //div[@role="listbox"]/child::mat-option/span[text()="${grafico}"]

Então não é exibido na lista o gráfico
    [Arguments]    ${grafico}

    Wait Until Element Is Enabled    ${tipo_de_grafico}
    Click Element    ${tipo_de_grafico}
    Sleep    1s
    # Scroll Element Into View    //div[@role="listbox"]/child::mat-option/span[text()="${grafico}"]
    Element Should Not Be Visible    //div[@role="listbox"]/child::mat-option/span[text()="${grafico}"]

Dado que esteja na tela inicial de Gráficos
    Acionar Gráficos

E informar o tipo de gráfico
    [Arguments]    ${tipo}
    Wait Until Element Is Enabled    ${tipo_de_grafico}
    Click Element    ${tipo_de_grafico}
    Wait Until Element Is Visible    //mat-option[.='${tipo}']
    Scroll Element Into View    //mat-option[.='${tipo}']
    Click Element    //mat-option[.='${tipo}']
    Click Button    ${graficos_btn_adicionar}

Então o sistema exibirá o gráfico para o tipo
    [Arguments]    ${tipo}
    Wait Until Element Is Visible    //mat-card/mat-card-header//mat-card-title[text()=' ${tipo} ']
    Element Should Be Visible    //mat-card/mat-card-header//mat-card-title[text()=' ${tipo} ']
    Wait Until Page Contains Element    ${graficos_svg_content}    timeout=30s
    Page Should Contain Element    ${graficos_svg_content}

E informar política
    [Arguments]    ${politica}
    Informar Política    ${politica}
    Acionar Consultar

Então o sistema exibirá o gráfico de acordo com a política
    [Arguments]    ${politica}
    Wait Until Page Contains Element    ${graficos_svg_content}    timeout=30s
    Page Should Contain Element    ${graficos_svg_content}
    Wait Until Element Is Visible
    ...    //*[name()='g'][contains(@class, 'highcharts-legend-item')]//*[name()='text'][text()='${politica}']
    Element Should Be Visible
    ...    //*[name()='g'][contains(@class, 'highcharts-legend-item')]//*[name()='text'][text()='${politica}']

Então o sistema não deverá exibir o campo de filtro de IP origem e IP servidor
    Element Should Not Be Visible    ${filtro_input_ip_origem}
    Element Should Not Be Visible    ${filtro_input_ip_servidor}

Então o sistema deverá exibir o campo de filtro de IP origem e IP servidor
    Scroll Element Into View    ${filtro_input_ip_origem}
    Element Should Be Visible    ${filtro_input_ip_origem}
    Scroll Element Into View    ${filtro_input_ip_servidor}
    Element Should Be Visible    ${filtro_input_ip_servidor}

Então o sistema exibirá o gráfico de acordo com o período
    [Arguments]    ${data_inicio}=${None}    ${data_fim}=${None}
    Wait Until Page Contains Element    ${graficos_svg_content}    timeout=30s
    Page Should Contain Element    ${graficos_svg_content}
    Wait Until Element Is Visible
    ...    //*[name()='g'][contains(@class, 'highcharts-axis-labels highcharts-xaxis-labels')]//*[name()='text'][contains(text(),'${data_inicio}')]
    Element Should Be Visible
    ...    //*[name()='g'][contains(@class, 'highcharts-axis-labels highcharts-xaxis-labels')]//*[name()='text'][contains(text(),'${data_inicio}')]

    IF    '${data_fim}' != '${None}'
        Wait Until Element Is Visible
        ...    //*[name()='g'][contains(@class, 'highcharts-axis-labels highcharts-xaxis-labels')]//*[name()='text'][contains(text(),'${data_fim}')]
        Element Should Be Visible
        ...    //*[name()='g'][contains(@class, 'highcharts-axis-labels highcharts-xaxis-labels')]//*[name()='text'][contains(text(),'${data_fim}')]
    END

E informar um cliente
    [Arguments]    @{cliente}
    Informar Cliente    @{cliente}

Então o sistema exibirá o gráfico de acordo com o cliente
    [Arguments]    ${cliente}
    Wait Until Page Contains Element    ${graficos_svg_content}    timeout=${IMPLICITY_WAIT}
    Page Should Contain Element    ${graficos_svg_content}
    Wait Until Element Is Visible
    ...    //*[name()='g'][contains(@class, 'highcharts-legend-item')]//*[name()='text'][text()='${cliente}']
    Element Should Be Visible
    ...    //*[name()='g'][contains(@class, 'highcharts-legend-item')]//*[name()='text'][text()='${cliente}']

E informar Últimos por Período
    [Arguments]    ${ultimos}    ${periodo}
    ${data_hora_fim}    Get Current Date
    ...    UTC
    ...    -3 hours
    ...    exclude_millis=${True}
    ...    result_format=%d/%m/%Y %H:%M
    ${unidades}    Create Dictionary
    ...    Segundos=seconds
    ...    Minutos=minutes
    ...    Horas=hours
    ...    Dias=days
    ...    Meses=months
    ...    Anos=years
    ${unidade}    Set Variable If    '${periodo}' in ${unidades}    ${unidades}[${periodo}]    ${None}
    ${data_hora_inicio}    CustomDateUtils.Subtract Periods From Current Date    ${unidades}[${periodo}]    ${ultimos}

    Informar Periodo por    ${ultimos}    ${periodo}
    Element Should Be Visible
    ...    //span[text()='Período']/following-sibling::p[contains(text(),'${data_hora_inicio}')]
    Element Should Be Visible    //span[text()='Período']/following-sibling::p[contains(text(),'${data_hora_fim}')]
    Acionar Consultar

Então o sistema exibirá o gráfico de acordo com Últimos por Período TALVEZ EXCLUIR
    Wait Until Page Contains Element    ${graficos_svg_content}    timeout=${IMPLICITY_WAIT}
    Page Should Contain Element    ${graficos_svg_content}
    ${data_inicial}    Get Text    //span[text()='Período']/following-sibling::p[1]
    ${data_final}    Get Text    //span[text()='Período']/following-sibling::p[2]
    Element Should Contain
    ...    //*[name()='g'][@class='highcharts-axis-labels highcharts-xaxis-labels']
    ...    ${data_inicial}
    Element Should Contain    //*[name()='g'][@class='highcharts-axis-labels highcharts-xaxis-labels']    ${data_final}

Então o sistema exibirá o gráfico de acordo com Últimos por Período
    Wait Until Page Contains Element    ${graficos_svg_content}    timeout=${IMPLICITY_WAIT}
    Page Should Contain Element    ${graficos_svg_content}
    

    ${ultima_data_horario}    Get Text    //*[@class="highcharts-axis-labels highcharts-xaxis-labels"]/*[last()]
    ${primeira_data_horario}    Get Text   //*[@class="highcharts-axis-labels highcharts-xaxis-labels"]/*[3]
    
    
    ${horario_string}    Convert To String    ${ultima_data_horario}
    ${horario}    Split String    ${horario_string}    separator=${SPACE}
    Set Test Variable    ${hora_minuto_segundo}    ${horario[1]}
    ${escala}    Split String    ${hora_minuto_segundo}    separator=:
    Set Test Variable    ${hora_fim}    ${escala[0]}

    ${inicio_horario_string}    Convert To String    ${primeira_data_horario}
    ${inicio_horario}    Split String    ${inicio_horario_string}    separator=${SPACE}
    Set Test Variable    ${inicio_hora_minuto_segundo}    ${inicio_horario[1]}
    ${inicio_escala}    Split String    ${inicio_hora_minuto_segundo}    separator=:
    Set Test Variable    ${hora_inicio}    ${inicio_escala[0]}

    ${hora_inicio_int}    Convert To Integer    ${hora_inicio}
    ${hora_fim_int}    Convert To Integer    ${hora_fim}
    Log To Console    Hora inicio: ${hora_inicio}
    Log To Console    Hora final: ${hora_fim}

    ${diferenca_inicio_fim}    Evaluate    ${hora_fim_int}-${hora_inicio_int}

    Log To Console    Diferença entre inicio e fim: ${diferenca_inicio_fim} hora(s)

    ${diferenca_inicio_fim_string}    Convert To String    ${diferenca_inicio_fim}

    Should Contain Any    ${diferenca_inicio_fim_string}    1    0


E informar Últimas propostas
    [Arguments]    ${quantidade}
    Informar Últimas propostas    ${quantidade}

E informar Código Operação
    [Arguments]    ${codigo}
    Informar Cód. Operação    ${codigo}

E informar Proposta
    [Arguments]    ${proposta}
    Informar Proposta    ${proposta}

E informar Resultado
    [Arguments]    ${resultado}
    Informar Resultado    ${resultado}

E informar Sucesso
    [Arguments]    ${sucesso}
    Informar Sucesso    ${sucesso}

E informar Filial
    [Arguments]    @{filial}
    Informar Filial    ${filial}

E informar Versão da Política
    [Arguments]    ${versao}
    Informar Versão da Política    ${versao}

E informar Mensagem
    [Arguments]    ${mensagem}
    Informar Mensagem    ${mensagem}

E informar Usuário
    [Arguments]    ${usuario}
    Informar Usuário    ${usuario}

E informar IP Origem
    [Arguments]    ${ip}
    Informar IP Origem    ${ip}

E informar IP Servidor
    [Arguments]    ${ip}
    Informar IP Servidor    ${ip}

Então o sistema exibirá o gráfico de acordo com o filtro
    [Arguments]    ${filtro}    ${valor}
    Wait Until Page Contains Element    ${graficos_svg_content}
    Page Should Contain Element    ${graficos_svg_content}
    IF    '${filtro}' == 'Sucesso'
        IF    '${valor}' == 'Sim'
            Element Should Be Visible    //mat-card-content//*[contains(text(), '${filtro}')]
        ELSE
            Element Should Be Visible    //mat-card-content//*[contains(text(), 'Insucesso')]
        END
    ELSE
        Element Should Contain    //*[name()='g'][contains(@class, 'highcharts-legend-item')]    ${valor}
    END

Então o sistema exibirá o gráfico com as últimas propostas
    [Arguments]    ${quantidade}
    Wait Until Page Contains Element    ${graficos_svg_content}
    Page Should Contain Element    ${graficos_svg_content}
    Element Should Contain
    ...    //*[name()='text']//*[name()='tspan'][not(contains(@class, 'highcharts-text-outline')) and contains(@style, 'font-weight:bold;')]
    ...    ${quantidade}
