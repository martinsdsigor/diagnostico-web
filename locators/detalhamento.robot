*** Settings ***
Documentation       Locators para a funcionalidade detalhamento


*** Variables ***
# Registros
${checkbox_primeiro_registro}                    xpath://*[@role="rowgroup"]/following::mat-checkbox[1]
${btn_submeter_proposta}                         xpath://span[text()="SUBMETER PROPOSTA"]

${detalhamento_mensagem_inicial}                 xpath://*[text()=' Abra os filtros e faça uma busca. ']
${detalhamento_table_resultados}                 xpath://table[@class='mat-table cdk-table mat-sort generic-table']/tbody/tr
${detalhamento_link_opcao_det}                   xpath://a[text()='Detalhamento']
${detalhamento_table_last_td_element}            xpath://table[@class='mat-table cdk-table mat-sort generic-table']/tbody/tr[1]/child::td[position()=last()]
${detalhamento_link_opcao_geral}                 xpath://span[text()='Geral ']/parent::a
${detalhamento_flx_politica_canvas}              xpath://canvas
${detalhamento_link_opcao_fluxo_da_politica}     xpath://span[text()='Fluxo da política ']/parent::a
${detalhamento_checkbox_first_variable}          xpath://div[@class='variable-table-values-wrapper']/div[1]/div/div[@class='column-check']
${detalhamento_filtro_variaveis}                 xpath://span[text()='Filtrar variáveis']/following::input
${detalhamento_exportar_variaveis}               xpath://span[text()='EXPORTAR VARIÁVEIS ']/parent::button
${detalhamento_primeira_variavel}                xpath://div[contains(@class, 'variable-table-values-wrapper')]/div[1]/div/div[@class='column-key']
${detalhamento_table_variaveis}                  xpath://div[contains(@class, 'variable-table-values-wrapper')]
${detalhamento_valor_processado}                 xpath://div[contains(@class, 'variable-table-values-wrapper')]/div[1]/div/div[@class='column-value']
${detalhamento_table_cod_operacao}               xpath://table/thead/tr/th[3][.=' Cód. Operação ']
${detalhamento_button_ultima_pagina}             xpath://button[@aria-label='Última página']
${detalhamento_button_proxima_pagina}            xpath://button[@aria-label='Próximo']
${detalhamento_button_pagina_anterior}           xpath://button[@aria-label='Anterior']
${detalhamento_button_primeira_pagina}           xpath://button[@aria-label='Primeira página']
${detalhamento_select_paginacao}                 xpath://mat-select[@aria-label='Itens por página']
${detalhamento_button_ressubmeter}               xpath://span[text()='RESSUBMETER']/parent::button
${detalhamento_button_painel}                    xpath://span[text()='PAINEL']/parent::button
${detalhamento_button_exportar_resultados}       //span[text()='EXPORTAR RESULTADOS']/parent::button
${detalhamento_thead_tabela}                     //table/thead/tr
${detalhamento_tbody_tabela}                     //table/tbody/tr
