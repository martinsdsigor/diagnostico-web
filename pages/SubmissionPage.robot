*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
E informar a politica
    [Arguments]    ${politica}    ${chave}
    
    Wait Until Element Is Enabled    ${label_politica}    ${IMPLICITY_WAIT}
    Click Element    //div[@class="input-box-policy"]/child::app-input-box[1]/div
    Input Text    ${input_politica}    ${politica}
    Wait Until Element Is Enabled
    ...    //*[text()="${politica}"]/parent::div/parent::div/following-sibling::div/child::div[2]
    Click Element    //*[text()="${politica}"]/parent::div/parent::div/following-sibling::div/child::div[2]

    Click Element    ${input_chave}
    Click Element    //p[text()="${chave}"]

Quando fizer o upload do arquivo
    [Arguments]    ${file_name}

    Wait Until Element Is Enabled    ${input_importar_csv}
    ${file_extension}    Split String    ${file_name}    separator=.

    Choose File    ${input_importar_csv}    ${EXECDIR}/files/uploads/${file_name}

    IF    '${file_extension[1]}' == csv
        ${size}    Get File Size    ${EXECDIR}/files/uploads/${file_name}

        IF    '${size}' > '0'
            ${span_file}    Get WebElement    //span[text()="Arquivo Importado: ${file_name}"]
            Element Should Contain    ${span_file}    Arquivo Importado: ${file_name}
        END
    END

Então é exibido um toast com a mensagem
    [Arguments]    ${mensagem}
    Sleep    2s
    Trocar para aba    https://rsk-neurotools-tst.riskpack.com.br/#/workflow/trace/submission    locator=url
    # Retornar para aba    workflow/trace/submission
    Wait Until Element Is Visible    ${toast}    ${IMPLICITY_WAIT}
    Element Should Contain    ${toast}    ${mensagem}

E modificar os valores da proposta
    [Arguments]    ${entrada}    ${valor}
    Wait Until Element Is Visible    //div[text()="${entrada}"]/parent::div/following-sibling::div/input
    Input Text    //div[text()="${entrada}"]/parent::div/following-sibling::div/input    ${valor}

Quando adicionar uma nova entrada
    [Arguments]    ${entrada}
    Wait Until Element Is Enabled    //div[text()="PROP_NOME"]/parent::div/following-sibling::div/input
    Click Element    ${btn_adicionar}
    Input Text    ${input_ultima_entrada}    ${entrada}

Quando remover uma entrada
    [Arguments]    ${entrada}
    Wait Until Element Is Enabled    //div[text()="${entrada}"]/parent::div/following-sibling::div/input
    Click Element    //div[text()="${entrada}"]/parent::div/preceding-sibling::div/mat-checkbox
    Click Element    ${btn_remover}

Dado que esteja na tela inicial Submissão
    Acionar Submissão
    Wait Until Element Is Visible    xpath://i[.=' close ']
    ${toast_visible}    Run Keyword And Return Status    Element Should Be Visible    xpath://i[.=' close ']
    IF    ${toast_visible}    Click Element    xpath://i[.=' close ']
    Element Should Be Visible    xpath://h3[text()='Nenhum teste encontrado com os parâmetros de busca informados.']

Então o sistema deve ordernar os resultados
    [Arguments]    ${coluna}    ${ordem}=crescente
    Sleep    1s
    ${cells}    SeleniumLibrary.Get Element Count    xpath://table/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${cells}    3
        ${next_row_exists}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath://table/tbody/tr[${counter+3}]/td[${coluna}]
        IF    ${next_row_exists} == ${False}            BREAK

        ${current}    Get Text    xpath://table/tbody/tr[${counter}]/td[${coluna}]
        ${next}    Get Text    xpath://table/tbody/tr[${counter+3}]/td[${coluna}]

        IF    '${ordem}' == 'crescente'
            IF    '${current}' < '${next}'                CONTINUE
        ELSE IF    '${ordem}' == 'decrescente'
            IF    '${current}' > '${next}'                CONTINUE
        END
    END

Quando informar a quantidade de propostas
    [Arguments]    ${quantidade}
    Wait Until Element Is Visible    ${submissao_texto_itens_por_pagina}
    Scroll Element Into View    ${submissao_texto_itens_por_pagina}
    Click Element    ${submissao_select_itens_por_pagina}
    Wait Until Element Is Visible    xpath://mat-option[@role='option']/span[text()=' ${quantidade} ']
    Click Element    xpath://mat-option[@role='option']/span[text()=' ${quantidade} ']

Quando acionar os 3 pontos ao final da primeira proposta
    Wait Until Element Is Visible    //table/tbody/tr[1]/td[9]
    Click Element    //table/tbody/tr[1]/td[9]
    ${id_do_teste}    SeleniumLibrary.Get Text    //table/tbody/tr[1]/td[3]
    ${politica_do_teste}    SeleniumLibrary.Get Text    //table/tbody/tr[1]/td[5]
    ${nome_do_teste}    SeleniumLibrary.Get Text    //table/tbody/tr[1]/td[2]
    Set Test Variable    ${submissao_id_do_teste}    ${id_do_teste}
    Set Test Variable    ${submissao_politica}    ${politica_do_teste}
    Set Test Variable    ${submissao_nome}    ${nome_do_teste}

E acionar "Detalhamento do teste"
    Wait Until Element Is Visible    //div[@id='mat-menu-panel-2']
    Click Element    ${submissao_botao_detalhamento_do_teste}

Quando acionar "Gráficos" no menu lateral
    Wait Until Element Is Visible    ${submissao_menu_graficos}    timeout=20s
    Wait Until Element Is Enabled    ${submissao_menu_graficos}    timeout=30s
    Click Element    ${submissao_menu_graficos}

E acionar "Exportar Relatório"
    Wait Until Element Is Visible    ${submissao_botao_exportar_relatorio}    timeout=20s
    Wait Until Element Is Enabled    ${submissao_botao_exportar_relatorio}    timeout=30s
    Click Button    ${submissao_botao_exportar_relatorio}

Então o sistema deve iniciar o download do arquivo
    [Arguments]    ${extensao_arquivo}=pdf
    ${nome_do_teste_uppercase}    Convert To Upper Case    ${submissao_nome}
    Verificar se download foi concluído    filename=Report_${nome_do_teste_uppercase}.${extensao_arquivo}

Então o sistema deve exibir os gráficos e dados da duração do teste
    Page Should Contain    ${submissao_nome}
    Page Should Contain    ${submissao_id_do_teste}
    Page Should Contain    ${submissao_politica}
    Page Should Contain    Gráfico da Execução
    Page Should Contain    Gráfico do resultado
    Page Should Contain    Dados da duração do teste
    Page Should Contain    Tempo máximo
    Page Should Contain    Tempo médio
    Page Should Contain    Tempo mínimo
    Page Should Contain    Desvio Padrão
    Page Should Contain    Tempo Total de processamento
    Page Should Contain    Quantidade total de proposta

Então o sistema exibirá relatório de cobertura da submissão
    Wait Until Page Contains    ${submissao_nome}
    Page Should Contain    ${submissao_nome}
    Page Should Contain    ${submissao_id_do_teste}
    Page Should Contain    ${submissao_politica}
    Page Should Contain    Submissões
    Page Should Contain    Submissões com sucesso
    Page Should Contain    Regra
    Page Should Contain    Ocorrências
    Page Should Contain    Cobertura
    Page Should Contain    Valor

E informar o nome do teste
    [Arguments]    ${nome_teste}

    Sleep    2s
    Click Element    ${input_nome_do_teste}
    Input Text    ${input_nome_do_teste}    ${nome_teste}

E informar o usuário
    [Arguments]    ${usuario}

    Wait Until Element Is Enabled    ${label_usuario}    ${IMPLICITY_WAIT}
    Click Element    ${label_usuario}
    Input Text    ${input_usuario}    ${usuario}

    Click Element    //p[.="${usuario}"]

E informar a Política
    [Arguments]    ${politica}

    Wait Until Element Is Enabled    ${label_politica}    ${IMPLICITY_WAIT}
    Click Element    ${label_politica}
    Input Text    ${input_politica}    ${politica}
    # Click Element    //p[text()="${politica}" and not(contains(@class,"selected-option"))]

E informar o status
    [Arguments]    ${status}

    Wait Until Element Is Enabled    ${label_status}    ${IMPLICITY_WAIT}
    Click Element    ${label_status}
    Input Text    ${input_status}    ${status}
    # Click Element    //p[text()="${status}"]
    # Click Element    //p[.="${status}"]
    # Press Keys    //p[.="${status}"]    RETURN
    # Click Element    //p[text()="${status}" and not(contains(@class,"selected-option"))]

E informar o ID do teste
    [Arguments]    ${id_teste}

    # Wait Until Element Is Enabled    ${input_id_do_teste}    ${IMPLICITY_WAIT}
    Sleep    2s
    Click Element    ${input_id_do_teste}
    Input Text    ${input_id_do_teste}    ${id_teste}

E informar Período por data
    [Arguments]    ${Data Inicial}    ${Data Final}
    Informar Período por data    ${Data Inicial}    ${Data Final}
    Acionar Consultar

E acionar Consultar
    Acionar Consultar

Então o sistema apresentará o resultado de acordo com ID e o período de teste informados
    [Arguments]    ${id_teste_submissao}    ${data_inicial}    ${data_final}
    ${quantidade_resultados}    SeleniumLibrary.Get Element Count    ${submissao_table_resultados}
    Should Not Be Equal As Integers    ${quantidade_resultados}    ${0}

    Wait Until Element Contains
    ...    ${submissao_table_resultados}/tbody/tr/child::td[position()=3]/span
    ...    ${id_teste_submissao}

    ${bmg_date_column}    Get Text    ${submissao_table_resultados}/tbody/tr/td[7]/span
    ${data_sem_horas}    Split String    ${bmg_date_column}    ${SPACE}•

    ${dt_inicial_string}    Convert Date    ${data_inicial}    result_format=%d/%m/%Y    date_format=%d/%m/%Y
    ${dt_final_string}    Convert Date    ${data_final}    result_format=%d/%m/%Y    date_format=%d/%m/%Y
    ${dt_teste_string}    Convert Date    ${data_sem_horas}[0]    result_format=%d/%m/%Y    date_format=%d/%m/%Y

    ${dt_inicial_sem_zero}    Replace String Using Regexp    ${dt_inicial_string}    (?<=/)(0)|^0+    ${EMPTY}
    ${dt_final_sem_zero}    Replace String Using Regexp    ${dt_final_string}    (?<=/)(0)|^0+    ${EMPTY}
    ${dt_teste_sem_zero}    Replace String Using Regexp    ${dt_teste_string}    (?<=/)(0)|^0+    ${EMPTY}

    IF    ${dt_inicial_sem_zero} < ${dt_teste_sem_zero} and ${dt_final_sem_zero} > ${dt_teste_sem_zero}
        ${id_teste_table_value}    Get Text    ${submissao_table_resultados}/tbody/tr/child::td[position()=3]/span
        Should Contain    ${id_teste_table_value}    ${id_teste_submissao}
    ELSE
        Fail    Data do teste fora do período informado
    END

Então é exibido um toast com a mensagem informada
    [Arguments]    ${mensagem}
    # Sleep    1s
    Wait Until Element Is Visible    ${toast}    timeout=30s
    Wait Until Element Is Enabled    ${toast}    timeout=30s
    Element Should Contain    ${toast}    ${mensagem}

Então o sistema listará apenas o status
    [Arguments]    ${status}

    ${mensagem_visivel}    Run Keyword And Return Status
    ...    Element Should Contain    ${toast}    Nenhum teste encontrado!

    IF    ${mensagem_visivel}
        Fail    Nenhum teste encontrado!
    ELSE
        ${linha}    SeleniumLibrary.Get Element Count    ${submissao_table_resultados}/tbody/tr
        FOR    ${counter}    IN RANGE    1    ${linha}    3
            ${next_row_exists}    Run Keyword And Return Status
            ...    Element Should Be Visible
            ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=8]
            IF    ${next_row_exists} == ${False}                BREAK

            ${status_temp}    Get Text
            ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=8]/span

            IF    '${status_temp}' == '${status}'
                CONTINUE
            ELSE
                Fail    Foi encontrado no resultado status diferente do Status:    '${status}'    informado no filtro.
            END
        END
    END

Então o sistema listará apenas a politica
    [Arguments]    ${politica}
    Sleep    1s
    ${linha}    SeleniumLibrary.Get Element Count    ${submissao_table_resultados}/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${linha}    3
        ${next_row_exists}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=5]
        IF    ${next_row_exists} == ${False}            BREAK

        ${politica_temp}    Get Text
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=5]/span
        IF    '${politica_temp}' == '${politica}'
            CONTINUE
        ELSE
            Fail
            ...    Foi encontrado no resultado politica diferente do politica:
            ...    '${politica}'
            ...    informado no filtro.
        END
    END

Então o sistema listará apenas histórico de testes com o Nome de teste
    [Arguments]    ${nome_do_teste}
    Sleep    1s
    ${linha}    SeleniumLibrary.Get Element Count    ${submissao_table_resultados}/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${linha}    3
        ${next_row_exists}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=2]
        IF    ${next_row_exists} == ${False}            BREAK

        ${nome_do_teste_temp}    Get Text
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=2]/span

        ${verifica_nome}    Run Keyword And Return Status
        ...    Should Contain
        ...    ${nome_do_teste_temp}
        ...    ${nome_do_teste}

        IF    ${verifica_nome}
            CONTINUE
        ELSE
            Fail    Foi encontrado no resultado nome_do_teste diferente do nome_do_teste do informado no filtro.
        END
    END

Então o sistema listará apenas histórico de testes com o Usuário
    [Arguments]    ${usuario}
    Sleep    1s
    ${linha}    SeleniumLibrary.Get Element Count    ${submissao_table_resultados}/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${linha}    3
        ${next_row_exists}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=4]
        IF    ${next_row_exists} == ${False}            BREAK

        ${usuario_temp}    Get Text
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=4]/span

        ${verifica_usuario}    Run Keyword And Return Status
        ...    Should Contain
        ...    ${usuario_temp}
        ...    ${usuario}

        IF    ${verifica_usuario}
            CONTINUE
        ELSE
            Fail    Foi encontrado no resultado usuario diferente do usuario do informado no filtro.
        END
    END

Então o sistema listará apenas histórico de testes com o período de datas informada
    [Arguments]    ${data_inicial}    ${data_final}
    Sleep    1s
    ${linha}    SeleniumLibrary.Get Element Count    ${submissao_table_resultados}/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${linha}    3
        ${next_row_exists}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=7]
        IF    ${next_row_exists} == ${False}            BREAK

        ${data_tempor}    Get Text    ${submissao_table_resultados}/tbody/tr[${counter}]/td[7]/span
        ${data_sem_horas}    Split String    ${data_tempor}    ${SPACE}•

        ${dt_inicial_string}    Convert Date    ${data_inicial}    result_format=%d/%m/%Y    date_format=%d/%m/%Y
        ${dt_final_string}    Convert Date    ${data_final}    result_format=%d/%m/%Y    date_format=%d/%m/%Y
        ${dt_teste_string}    Convert Date    ${data_sem_horas}[0]    result_format=%d/%m/%Y    date_format=%d/%m/%Y

        ${dt_inicial_sem_zero}    Replace String Using Regexp    ${dt_inicial_string}    (?<=/)(0)|^0+    ${EMPTY}
        ${dt_final_sem_zero}    Replace String Using Regexp    ${dt_final_string}    (?<=/)(0)|^0+    ${EMPTY}
        ${dt_teste_sem_zero}    Replace String Using Regexp    ${dt_teste_string}    (?<=/)(0)|^0+    ${EMPTY}
        Log To Console    ${dt_teste_sem_zero}

        IF    ${dt_inicial_sem_zero} < ${dt_teste_sem_zero} and ${dt_final_sem_zero} > ${dt_teste_sem_zero}
            CONTINUE
        ELSE
            Fail    Data do teste fora do período informado
        END
    END
