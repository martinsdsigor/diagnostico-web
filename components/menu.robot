*** Settings ***
Documentation    Componentes para as funcionalidades Menu e Filtro

*** Variables ***

# Menu lateral
${menu_detalhamento}    xpath://a[.='account_treeDetalhamento']
${menu_submissao}    xpath://a[.='playlist_add_checkSubmissão']
${menu_busca_variaveis}    xpath://a[.='historyBusca de variáveis']
${menu_graficos}    xpath://a[.='pollGráficos']

# Filtro
${filtro_button_filtros}    xpath://button[.='filter_listFiltros']
${filtro_icone_voltar}    xpath://a[.='arrow_back']
${filtro_periodo}    xpath://div[@class='mat-select-trigger ng-tns-c81-28']
${filtro_input_ultimos_periodo}    xpath://div[@class='mat-select-trigger ng-tns-c81-4']
${filtro_select_ultimos_periodo}    xpath://section[@class='inputSelect']
${filtro_input_ultimas_propostas}    xpath://span[.='Últimas propostas']/following-sibling::input
${filtro_input_codigo_operacao}    xpath://span[.='Cód. Operação']/following-sibling::input
${filtro_input_proposta}    xpath://span[.='Proposta']/following-sibling::input
${filtro_select_politica}    xpath://div[.='Políticaarrow_drop_down']
${filtro_select_resultado}    xpath://div[.='Resultadoarrow_drop_up']
${filtro_select_sucesso}    xpath://div[.='Sucessoarrow_drop_down']
${filtro_input_filial}      xpath://span[.='Filial']/following-sibling::input
${filtro_input_versao_da_politica}      xpath://span[.='Versão da Política']/following-sibling::input
${filtro_input_mensagem}      xpath://span[.='Mensagem']/following-sibling::input
${filtro_input_usuario}      xpath://span[.='Usuário']/following-sibling::input
${filtro_input_id_lote}      xpath://span[.='ID do Lote']/following-sibling::input
${filtro_input_ip_origem}      xpath://span[.='IP Origem']/following-sibling::input
${filtro_input_ip_servidor}      xpath://span[.='IP Servidor']/following-sibling::input
${filtro_button_consultar}      xpath://button/span[text()='CONSULTAR']
