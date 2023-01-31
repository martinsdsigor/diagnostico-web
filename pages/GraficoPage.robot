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
