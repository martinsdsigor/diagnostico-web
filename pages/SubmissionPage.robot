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

    ${btn_fechar_visivel}    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    xpath://i[.=' close ']

    IF    ${btn_fechar_visivel}
        Wait Until Element Is Visible    xpath://i[.=' close ']
        ${texto_visivel}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath://h3[text()="Nenhum teste encontrado com os parâmetros de busca informados."]
        # ${toast_visible}    Run Keyword And Return Status    Element Should Be Visible    xpath://i[.=' close ']
        IF    ${texto_visivel}    Click Element    xpath://i[.=' close ']
    END

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

    Wait Until Element Is Enabled    ${label_politica_filtro}    ${IMPLICITY_WAIT}
    Click Element    ${label_politica_filtro}
    Input Text    ${input_politica_filtro}    ${politica}
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
    Wait Until Element Is Visible    ${toast}    timeout=60s
    Wait Until Element Is Enabled    ${toast}    timeout=60s
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
                Fail    Foi encontrado no resultado status diferente do Status: '${status}' informado no filtro.
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
        ${dt_teste_string}    Convert Date
        ...    ${data_sem_horas}[0]
        ...    result_format=%d/%m/%Y
        ...    date_format=%d/%m/%Y

        ${dt_inicial_sem_zero}    Replace String Using Regexp    ${dt_inicial_string}    (?<=/)(0)|^0+    ${EMPTY}
        ${dt_final_sem_zero}    Replace String Using Regexp    ${dt_final_string}    (?<=/)(0)|^0+    ${EMPTY}
        ${dt_teste_sem_zero}    Replace String Using Regexp    ${dt_teste_string}    (?<=/)(0)|^0+    ${EMPTY}
        Log To Console    ${dt_teste_sem_zero}

        IF    ${dt_inicial_sem_zero} <= ${dt_teste_sem_zero} and ${dt_final_sem_zero} >= ${dt_teste_sem_zero}
            CONTINUE
        ELSE
            Fail    Data do teste fora do período informado
        END
    END

E o botão de três pontinhos estará desabilitado para o status
    [Arguments]    ${status}
    ${linha}    SeleniumLibrary.Get Element Count    ${submissao_table_resultados}/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${linha}    3
        ${next_row_exists}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=8]
        IF    ${next_row_exists} == ${False}            BREAK

        ${btn_tres_pontinhos_temp}    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    ${submissao_table_resultados}/tbody/tr[${counter}]/child::td[position()=9]/button[contains(@class,"mat-button-disabled")]

        IF    ${btn_tres_pontinhos_temp}
            CONTINUE
        ELSE
            Fail    O botão para o Status: ${status} deve estar desabilitado.
        END
    END

E acionar o botão de "Três pontinhos"
    ${id_do_teste}    SeleniumLibrary.Get Text    ${submissao_table_resultados}/tbody/tr[1]/td[3]
    ${enviado_concluido_do_teste}    SeleniumLibrary.Get Text    ${submissao_table_resultados}/tbody/tr[1]/td[6]
    ${apenas_enviado}    Split String    ${enviado_concluido_do_teste}    ${SPACE}•

    Set Test Variable    ${submissao_id_do_teste}    ${id_do_teste}
    Set Test Variable    ${submissao_enviado_do_teste}    ${apenas_enviado}[0]

    Wait Until Element Is Enabled    ${submissao_table_resultados}/tbody/tr[1]/td[9]/button
    Click Button    ${submissao_table_resultados}/tbody/tr[1]/td[9]/button

E acionar "Download massa de teste"
    Wait Until Element Is Enabled    ${btn_download_massa_de_teste}
    Click Button    ${btn_download_massa_de_teste}

E acionar "Download de resultados"
    IF    ${submissao_enviado_do_teste} >= ${15}
        Wait Until Element Is Enabled    ${btn_download_resultado}
        Click Button    ${btn_download_resultado}
    ELSE
        Fail    Não há resultado cujo arquivo enviado tenha mais que 15 registros.
    END

Verificar se download foi concluído
    [Arguments]    ${filename}=${None}
    Sleep    2s
    Log To Console    nomeDoArquivo = ${filename}
    ${file}    Get File Size    ${EXECDIR}/files/downloads/${filename}
    ${arquivos_no_diretorio}    List Files In Directory    ${EXECDIR}/files/downloads

    Should Not Be Equal As Integers    ${file}    ${0}
    List Should Contain Value    ${arquivos_no_diretorio}    ${filename}

E download do arquivo é iniciado e concluído
    [Arguments]    ${formato}
    Verificar se download foi concluído    filename=${submissao_id_do_teste}_${formato}.zip

E o sistema deve ordernar os resultados
    [Arguments]    ${coluna}    ${ordenacao}
    Então o sistema deve ordernar os resultados    ${coluna}    ${ordenacao}

E acionar a coluna
    [Arguments]    ${coluna}
    Quando acionar a coluna    ${coluna}

E o sistema deve exibir os gráficos e dados da duração do teste
    Então o sistema deve exibir os gráficos e dados da duração do teste

Quando acionar Novo teste
    Wait Until Element Is Enabled    ${btn_novo_teste_mobile}
    Click Button    ${btn_novo_teste_mobile}

Então o sistema exibirá um modal para submissão do novo teste
    Wait Until Element Is Visible    ${submissao_modal_novo_teste}
    Wait Until Element Is Enabled    ${submissao_modal_novo_teste}

E botão "Testar política" desabilitado
    ${disabled}    SeleniumLibrary.Get Element Attribute    ${submissao_modal_btn_testar_politica}    disabled
    Should Be Equal    true    ${disabled}
    Element Should Be Disabled    ${submissao_modal_btn_testar_politica}

E botão "Testar política" habilitado
    Wait Until Element Is Visible    ${submissao_modal_btn_testar_politica}
    Element Should Be Enabled    ${submissao_modal_btn_testar_politica}

Quando inserir no campo 'Nome do teste' um nome do teste
    [Arguments]    ${nome_novo_teste}

    ${numero_aleatorio} =    Set Variable    ${{random.randint(0, 1000)}}

    Sleep    2s
    Click Element    ${submissao_modal_input_nome_do_teste}
    Input Text    ${submissao_modal_input_nome_do_teste}    ${nome_novo_teste}_${numero_aleatorio}

E selecionar a política desejada
    [Arguments]    ${politica}

    Sleep    2s
    Click Element    ${submissao_modal_input_politica}
    Input Text    ${submissao_modal_input_politica}    ${politica}
    Wait Until Element Is Enabled    //span[text()=" ${politica} " and contains(@class,'mat-option-text')]
    Click Element    //span[text()=" ${politica} " and contains(@class,'mat-option-text')]

E selecionar o campo chave desejado
    [Arguments]    ${campo_chave}

    Wait Until Page Contains Element    ${submissao_modal_input_campo_chave}    timeout=10s
    Click Element    ${submissao_modal_input_campo_chave}
    Wait Until Element Is Enabled    //span[contains(.,'${campo_chave}')]
    Click Element    //span[contains(.,'${campo_chave}')]

E acionar o botão Importar massa de dados
    Wait Until Element Is Enabled    ${submissao_modal_btn_importar_massa}
    Click Button    ${submissao_modal_btn_importar_massa}

E selecine o arquivo
    [Arguments]    ${file_name}

    Set Test Variable    ${submissao_modal_file_name}    ${file_name}

    ${file_extension}    Split String    ${file_name}    separator=.
    Choose File    ${submissao_modal_input_importar_csv}    ${EXECDIR}/files/uploads/${file_name}

    ${size}    Get File Size    ${EXECDIR}/files/uploads/${file_name}

    IF    '${size}' > '0'
        ${label_file}    Get WebElement    //label[@id='fileName' and text()="${file_name} - "]
        Element Should Contain    ${label_file}    ${file_name}
    END

Então o sistema deverá exibir o nome do arquivo ao invés do botão "Importar massa de dados"
    Element Should Not Be Visible    ${submissao_modal_btn_importar_massa}
    Element Should Contain    ${submissao_modal_label_file_name}    ${submissao_modal_file_name}

Quando acionar o botão "Testar política"
    Wait Until Element Is Enabled    ${submissao_modal_btn_testar_politica}
    Click Button    ${submissao_modal_btn_testar_politica}

E exibir a tela de submissão aplicando o filtro por id da submissão de teste
    Wait Until Element Is Visible    ${submissao_table_resultados}/tbody/tr[1]    timeout=60s
    Element Should Be Visible    ${submissao_table_resultados}/tbody/tr[1]/td[3]
    Element Should Be Visible    ${submissao_table_resultados}/tbody/tr[1]/td[8]

    ${table_teste_id}    SeleniumLibrary.Get Text
    ...    ${submissao_table_resultados}/tbody/tr[1]/child::td[position()=3]/span
    ${input_teste_id}    Get Value    ${input_id_do_teste}
    Should Contain    ${input_teste_id}    ${table_teste_id}

E exibir o registro da submissão com status
    [Arguments]    ${status}

    Element Should Contain    ${submissao_table_resultados}/tbody/tr[1]/td[8]    ${status}

E acionar o botão "Cancelar"
    Wait Until Element Is Enabled    ${submissao_modal_btn_cancelar}
    Click Button    ${submissao_modal_btn_cancelar}

Então o botão "Testar política" permanece desabilitado
    E botão "Testar política" desabilitado
