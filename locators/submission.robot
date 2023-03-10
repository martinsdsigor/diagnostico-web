*** Settings ***
Documentation       Locators para a funcionalidade submission


*** Variables ***
${toast}                                            //div[@class="snack-bar-message"]/div/span
${btn_adicionar}                                    //span[text()="ADICIONAR"]
${input_ultima_entrada}
...                                                 //div[@class="container-table ng-star-inserted"]/div[last()]/div/div[2]/input
${btn_remover}                                      //span[text()="REMOVER"]
${label_politica}                                   //div[@class="select-label"]
${input_politica}                                   //div[@class="search-box ng-star-inserted"]/input
${label_politica_filtro}                            //div[.='PolíticaSelecione']
${input_politica_filtro}
...                                                 //span[text()="Política"]/parent::div/parent::div/following-sibling::div/div/input
${input_importar_csv}
...                                                 //div[@class="input-box-file ng-star-inserted"]/input
${input_chave}
...                                                 //div[@class="input-box-policy"]/child::app-input-box[2]
${label_usuario}                                    //div[.='UsuárioSelecionearrow_drop_down']

${input_usuario}
...                                                 //div[@class='collapse-box ng-star-inserted active']//input[@class='ng-untouched ng-pristine ng-valid']
${label_status}                                     //div[.='StatusSelecionearrow_drop_down']
${input_status}
...                                                 //div[@class='collapse-box ng-star-inserted active']//input[@class='ng-untouched ng-pristine ng-valid']
${input_nome_do_teste}
...                                                 //input[@class='custom-input ng-untouched ng-pristine ng-valid']
${input_id_do_teste}
...                                                 //span[.='ID do teste']/following-sibling::input
${submissao_table_resultados}
...                                                 //table[@class='mat-table cdk-table mat-sort ng-tns-c164-3 ng-star-inserted']
${mensagem_nenhum_teste_encontrado}
...                                                 //h3[text()='Nenhum teste encontrado com os parâmetros de busca informados.']
${submissao_menu_relatorio_cobertura}               //span[.='Relatório de cobertura    ']/parent::a
${submissao_menu_graficos}                          //span[.='Gráficos ']/parent::a[contains(@href, '/graphs')]
${submissao_botao_exportar_relatorio}               //b[.='EXPORTAR RELATÓRIO']/parent::span/parent::button
${submissao_botao_detalhamento_do_teste}            //button[.=' Detalhamento do teste ']
${submissao_texto_itens_por_pagina}                 xpath://div[text()=' Itens por página ']
${submissao_select_itens_por_pagina}                xpath://mat-select[@role='combobox']
${btn_remover_politica_selecionada}
...                                                 //*[@class="mat-icon notranslate remove material-icons mat-icon-no-color ng-star-inserted"]

${btn_download_massa_de_teste}
...                                                 //button[contains(.,'Download massa de teste')]
${btn_download_resultado}                           //button[contains(.,'Download resultado')]
${submissao_button_ultima_pagina}                   //button[@aria-label='Última página']
${submissao_button_proxima_pagina}                  //button[@aria-label='Próximo']
${submissao_button_pagina_anterior}                 //button[@aria-label='Anterior']
${submissao_button_pagina_anterior_desabilitada}
...                                                 //button[@aria-label='Anterior' and @disabled='true']
${btn_novo_teste_mobile}
...                                                 //app-test/div[2]/div/div[2]/div[2]/button
${btn_novo_teste_desktop}
...                                                 //div[contains(@class,'no-desktop ng-tns-c164-3')]/button/p[text()="NOVO TESTE"]
${submissao_modal_novo_teste}                       //mat-toolbar[text()=' Novo teste ']
${submissao_modal_input_nome_do_teste}
...                                                 //input[@placeholder='Escreva aqui um nome para o teste']
${submissao_modal_input_politica}                   //input[@placeholder='Buscar política']
${submissao_modal_input_campo_chave}
...                                                 //div[@class='container-modal']/form/div[4]/mat-select[@placeholder="Selecione um campo chave"]
${submissao_modal_input_importar_csv}               //input[@id='inputField']
${submissao_modal_btn_importar_massa}               //button[text()="IMPORTAR MASSA DE DADOS"]
${submissao_modal_btn_testar_politica}              //button[text()="TESTAR POLÍTICA"]
${submissao_modal_btn_cancelar}                     //button[text()="CANCELAR"]
${submissao_modal_label_file_name}                  //label[@id='fileName']
${submissao_modal_mat_select_campo_chave}           //mat-select[@placeholder="Selecione um campo chave"]

# //span[text()=' BATCH_TST ']
# //span[text()=' PROP_CPF ']
# //label[@id='fileName' and text()="massa_receita_federal_dse_100.csv - "]
# //span[contains(.,'Arquivo de entrada maior do que o permitido: A quantidade de linhas do arquivo,')] # excluíndo os nomes das colunas, não pode ser maior que 1500

# //span[.='Enviado com sucesso!']
