*** Settings ***
Resource    ./mapper.robot


*** Keywords ***
Usuario ter acessado o sistema
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Selenium Implicit Wait    ${IMPLICITY_WAIT}
    Organizar arquivos de log    deletar    png    
    
    

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

    
Organizar arquivos de log
    [Arguments]    ${action}    ${file_extension}    ${folder}=${None}

    ${directory_list}    List Files In Directory    ${EXECDIR}    *.${file_extension}

    IF    '${action}' == 'mover'

        Create Directory    ${folder}
        
        FOR    ${item}    IN    @{directory_list}
            Move File    ${item}    ${folder}
            Log To Console    ${item} movido para pasta ${folder}
        END

    ELSE IF    '${action}' == 'deletar'

        FOR    ${item}    IN    @{directory_list}
            Remove File    ${item}
            Log To Console    ${item} deletado!!
        END
        
    END

    

Trocar para aba
    [Arguments]    ${title}
    Switch Window    title:${title}    timeout=${IMPLICITY_WAIT}
