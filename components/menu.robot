*** Settings ***
Documentation       Components para funcionalidade Menu
Resource            ../config/mapper.robot


*** Keywords ***
Acionar Detalhamento
    Element Should Be Visible    ${menu_detalhamento}
    Click Element    ${menu_detalhamento}

Acionar Submissão
    Element Should Be Visible    ${menu_submissao}
    Click Element    ${menu_submissao}

Acionar Busca de variáveis
    Element Should Be Visible    ${menu_busca_variaveis}
    Click Element    ${menu_busca_variaveis}

Acionar Gráficos
    Element Should Be Visible    ${menu_graficos}
    Click Element    ${menu_graficos}