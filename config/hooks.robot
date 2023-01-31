*** Settings ***
Resource    ./mapper.robot
Resource    ../pages/HomePage.robot


*** Keywords ***
Usuario loga e acessa o produto

    ${download_directory}    Join Path    ${EXECDIR}    files    downloads
    ${prefs}    Create Dictionary    download.default_directory=${download_directory}
    # ${prefs}    Create Dictionary    download.default_directory=${EXECDIR}/files/downloads
    
    Open Browser    ${BASE_URL}    ${BROWSER}    options=add_experimental_option("prefs",${prefs});add_experimental_option("excludeSwitches", ["enable-logging"])
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

    Close Browser

    Organizar arquivos de log    deletar    csv

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
    ${file}    Get File Size    ${EXECDIR}/files/downloads/${filename}
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