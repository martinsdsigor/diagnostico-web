*** Settings ***
Resource    ./mapper.robot
Resource    ../pages/HomePage.robot


*** Keywords ***
Usuario loga e acessa o produto
    # Cria a pasta downloads para evitar que testes falhem.
    ${download_outputdir}  Join Path    ${EXECDIR}    files    downloads
    Create Directory    ${download_outputdir}
    # Adiciona todos os downloads de arquivos no caminho files/downloads
    ${download_directory}    Join Path    ${EXECDIR}    files    downloads
    ${prefs}    Create Dictionary    download.default_directory=${download_directory}

    Open Browser
    ...    ${BASE_URL}
    ...    ${BROWSER}
    ...    options=add_experimental_option("prefs",${prefs});add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window
    Set Selenium Implicit Wait    ${IMPLICITY_WAIT}
    Informar as credenciais de acesso    ${USERNAME}    ${PASSWORD}
    Acionar Diagnostico Workflow
    Trocar para aba    Diagnóstico Workflow
    Organizar arquivos de log    directory=${EXECDIR}    action=deletar    file_extension=png

Evidenciar teste na pasta
    [Arguments]    ${folder}

    ${full_directory}    Convert To String    ${SCREENSHOT_OUTPUTDIR}/${folder}
    Create Directory    ${full_directory}
    Set Screenshot Directory    ${full_directory}
    ${string_tag}    Convert To String    ${TEST_TAGS}
    ${tag}    Remove String    ${string_tag}    '

    ${date}    Get Time
    ${date_string}    Convert To String    ${date}
    ${date_formated}    Replace String    ${date_string}    :    _

    Sleep    1s

    IF    '${TEST_STATUS}' == 'PASS'
        Capture Page Screenshot    filename=${tag} [ SUCESSO ] ${date_formated}.png
    ELSE IF    '${TEST_STATUS}' == 'FAIL'
        Capture Page Screenshot    filename=${tag} [ FALHA ] ${date_formated}.png
    END

    # Close Browser
    Close All Browsers

    Organizar arquivos de log    deletar    csv
    Organizar arquivos de log    deletar    pdf
    Organizar arquivos de log    deletar    zip

Organizar arquivos de log
    [Arguments]    ${action}    ${file_extension}    ${folder}=${None}    ${directory}=${EXECDIR}//files//downloads

    ${directory_list}    List Files In Directory    ${directory}    *.${file_extension}

    IF    '${action}' == 'mover'
        Create Directory    ${folder}

        FOR    ${item}    IN    @{directory_list}
            Move File    ${item}    ${folder}
            Log To Console    ${item} movido para pasta ${folder}
        END
    ELSE IF    '${action}' == 'deletar'
        FOR    ${item}    IN    @{directory_list}
            Remove File    ${directory}/${item}
            Log To Console    ${item} deletado!!
        END
    END

Trocar para aba
    [Arguments]    ${value}    ${locator}=title
    Sleep    1s
    Switch Window    ${locator}:${value}    timeout=${IMPLICITY_WAIT}

Retornar para aba
    [Arguments]    ${path}
    Sleep    1s
    Switch Window    url:https://rsk-neurotools-tst.riskpack.com.br/#/${path}

Verificar se download foi concluído
    [Arguments]    ${filename}=${None}
    ${caminho_arquivo}    Join Path    ${EXECDIR}    files    downloads
    Wait Until Created    ${caminho_arquivo}/${filename}    timeout=${IMPLICITY_WAIT}
    ${file}    Get File Size    ${EXECDIR}/files/downloads/${filename}

    ${arquivos_no_diretorio}    List Files In Directory    ${EXECDIR}/files/downloads

    Log To Console    ${arquivos_no_diretorio} encontrado no diretório /files/downloads

    Should Not Be Equal As Integers    ${file}    ${0}

Trocar para conta
    [Arguments]    ${conta}

    Close Window
    Trocar para aba    Portal Riskpack
    Wait Until Element Is Visible    //label[@class="label-select"]
    Click Element    //label[@class="label-select"]
    Wait Until Element Is Visible    //input[@placeholder="Digite aqui"]
    Input Text    //input[@placeholder="Digite aqui"]    ${conta}
    Wait Until Element Is Visible    //div[@class="content-options"]/p[1]
    Click Element    //div[@class="content-options"]/p[1]

Dado ter selecionado a conta
    [Arguments]    ${conta}
    Trocar para conta    ${conta}
    ${visivel}    Run Keyword And Return Status    Element Should Be Visible    ${home_button_termo_aceite}
    IF    ${visivel}    Click Button    ${home_button_termo_aceite}
    Sleep    1s
    Acionar Diagnostico Workflow
    Trocar para aba    Diagnóstico Workflow
