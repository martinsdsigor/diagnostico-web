*** Settings ***
Documentation       Locators para a funcionalidade gráfico


*** Variables ***
${tipo_de_grafico}                  //*[@id="mat-select-value-1"]
${graficos_btn_adicionar}           //button[text()="ADICIONAR"]
${btn_download}                     //button[text()="Download"]
${graficos_mensagem_de_fundo}       //div[text()=' Selecione os Filtros e escolha um gráfico. ']
${graficos_svg_content}
...                                 //div[contains(@id, 'highcharts')]//*[name()='svg']//*[name()='g'][@class='highcharts-series-group']//*[name()='g'][contains(@class, 'highcharts-series')]
