*** Settings ***
Documentation       Locators para a funcionalidade submission


*** Variables ***
${toast}                                    //div[@class="snack-bar-message"]/div/span
${btn_adicionar}                            //span[text()="ADICIONAR"]
${input_ultima_entrada}
...                                         //div[@class="container-table ng-star-inserted"]/div[last()]/div/div[2]/input
${btn_remover}                              //span[text()="REMOVER"]
${label_politica}                           //div[@class="select-label"]
${input_politica}                           //div[@class="search-box ng-star-inserted"]/input
${input_importar_csv}                       //div[@class="input-box-file ng-star-inserted"]/input
${input_chave}                              //div[@class="input-box-policy"]/child::app-input-box[2]
${submissao_texto_itens_por_pagina}         xpath://div[text()=' Itens por página ']
${submissao_select_itens_por_pagina}        xpath://mat-select[@role='combobox']
${submissao_menu_relatorio_cobertura}       //span[.='Relatório de cobertura    ']/parent::a
${submissao_menu_graficos}                  //span[.='Gráficos ']/parent::a[contains(@href, '/graphs')]
${submissao_botao_exportar_relatorio}       //b[.='EXPORTAR RELATÓRIO']/parent::span/parent::button
${submissao_botao_detalhamento_do_teste}    //button[.=' Detalhamento do teste ']
