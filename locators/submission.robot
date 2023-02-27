*** Settings ***
Documentation       Locators para a funcionalidade submission


*** Variables ***
${toast}                                    //div[@class="snack-bar-message"]/div/span
${btn_adicionar}                            //span[text()="ADICIONAR"]
${input_ultima_entrada}
...    //div[@class="container-table ng-star-inserted"]/div[last()]/div/div[2]/input
${btn_remover}                              //span[text()="REMOVER"]
${label_politica}                           //div[.='PolíticaSelecione']
${input_politica}
...                                         //span[text()="Política"]/parent::div/parent::div/following-sibling::div/div/input
${input_importar_csv}                       //div[@class="input-box-file ng-star-inserted"]/input
${input_chave}                              //div[@class="input-box-policy"]/child::app-input-box[2]
${label_usuario}                            //div[.='UsuárioSelecionearrow_drop_down']
${input_usuario}
...                                         //div[@class='collapse-box ng-star-inserted active']//input[@class='ng-untouched ng-pristine ng-valid']
${label_status}                             //div[.='StatusSelecionearrow_drop_down']
${input_status}
...                                         //div[@class='collapse-box ng-star-inserted active']//input[@class='ng-untouched ng-pristine ng-valid']
${input_nome_do_teste}                      //input[@class='custom-input ng-untouched ng-pristine ng-valid']
${input_id_do_teste}                        //span[.='ID do teste']/following-sibling::input
${submissao_table_resultados}
...    //table[@class='mat-table cdk-table mat-sort ng-tns-c164-3 ng-star-inserted']
${mensagem_nenhum_teste_encontrado}
...    //h3[text()='Nenhum teste encontrado com os parâmetros de busca informados.']
${submissao_menu_relatorio_cobertura}       //span[.='Relatório de cobertura    ']/parent::a
${submissao_menu_graficos}                  //span[.='Gráficos ']/parent::a[contains(@href, '/graphs')]
${submissao_botao_exportar_relatorio}       //b[.='EXPORTAR RELATÓRIO']/parent::span/parent::button
${submissao_botao_detalhamento_do_teste}    //button[.=' Detalhamento do teste ']
${submissao_texto_itens_por_pagina}         xpath://div[text()=' Itens por página ']
${submissao_select_itens_por_pagina}        xpath://mat-select[@role='combobox']
