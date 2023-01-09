*** Settings ***
Documentation       Locators para as funcionalidades Menu e Filtro

*** Variables ***
# Menu lateral
${menu_detalhamento}                    xpath://a[.='account_treeDetalhamento']
${menu_submissao}                       xpath://a[.='playlist_add_checkSubmissão']
${menu_busca_variaveis}                 xpath://a[.='historyBusca de variáveis']
${menu_graficos}                        xpath://a[.='pollGráficos']

# Filtro
${filtro_button_filtros}                xpath://button[.='filter_listFiltros']
${filtro_icone_voltar}                  xpath://a[.='arrow_back']
${filtro_select_contratante}            xpath://span[.='Contratante']/parent::div/parent::div
${filtro_periodo}                       xpath://app-input-date[@class='full-width ng-star-inserted']
${filtro_input_ultimos_periodo}         xpath://span[.='Últimos']/following-sibling::input
${filtro_select_ultimos_periodo}        xpath://section[@class='inputSelect']
${filtro_input_ultimas_propostas}       xpath://span[.='Últimas propostas']/following-sibling::input
${filtro_input_codigo_operacao}         xpath://span[.='Cód. Operação']/following-sibling::input
${filtro_input_proposta}                xpath://span[.='Proposta']/following-sibling::input
${filtro_select_politica}               xpath://div[.='Políticaarrow_drop_down']
${filtro_politica_search_box}           xpath://span[.='Política']/following::div[1]/div/input
${filtro_select_resultado}              xpath://div[.='Resultadoarrow_drop_up']
${filtro_select_sucesso}                xpath://div[.='Sucessoarrow_drop_down']
${filtro_sucesso_search_box}            xpath://span[.='Sucesso']/following::div/div/input
${filtro_input_filial}                  xpath://span[.='Filial']/following-sibling::input
${filtro_input_versao_da_politica}      xpath://span[.='Versão da Política']/following-sibling::input
${filtro_input_mensagem}                xpath://span[.='Mensagem']/following-sibling::input
${filtro_input_usuario}                 xpath://span[.='Usuário']/following-sibling::input
${filtro_input_id_lote}                 xpath://span[.='ID do Lote']/following-sibling::input
${filtro_input_ip_origem}               xpath://span[.='IP Origem']/following-sibling::input
${filtro_input_ip_servidor}             xpath://span[.='IP Servidor']/following-sibling::input
${filtro_button_consultar}              xpath://span[.='CONSULTAR']/parent::button

# Filtro - Calendário
${calendar_container}                   xpath://owl-date-time-container[contains(@id, 'owl-dt-picker-0')]
${calendar_dropdown_year}               xpath://button[contains(@aria-label, 'Choose month and year')]
${calendar_button_definir}              xpath://button[.='Definir']
${calendar_input_start_date}            xpath://span[.='Início:']/parent::span/parent::div
${calendar_input_end_date}              xpath://span[.='Fim:']/parent::div