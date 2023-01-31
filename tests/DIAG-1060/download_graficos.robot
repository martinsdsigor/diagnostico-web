*** Settings ***
Resource    ../../config/mapper.robot

Documentation   Testes Relacionados ao Requisito DIAG-1060

Test Setup    Usuario loga e acessa o produto
Test Teardown    Evidenciar teste na pasta    DIAG-1060



*** Test Cases ***
O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Taxa de Duração de Propostas
    [Tags]    DIAG-1053
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Taxa de Duração de Propostas
    Então o arquivo com o nome do gráfico é salvo com sucesso    Taxa Duracao Propostas.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição de Propostas por Contratante.
    [Tags]    DIAG-1168
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição de Propostas por Cliente
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição de Propostas por Cliente.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição Filiais.
    [Tags]    DIAG-1169
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição Filiais
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição Filiais.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição por IP de Origem.
    [Tags]    DIAG-1170
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição por IP de Origem
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição por IP de Origem.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição por IP de Servidor.
    [Tags]    DIAG-1171
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição por IP de Servidor
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição por IP de Servidor.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição por Mensagens.
    [Tags]    DIAG-1172
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição por Mensagens
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição por Mensagens.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição por Resultado.
    [Tags]    DIAG-1173
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição por Resultado
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição por Resultado.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição por Sucesso.
    [Tags]    DIAG-1174
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição por Sucesso
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição por Sucesso.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição por Usuários.
    [Tags]    DIAG-1175
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição por Usuários
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição por Usuários.csv
    

O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição por Versões de Política.
    [Tags]    DIAG-1182
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição por Versões de Política
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição por Versões de Política.csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Volume de Propostas (Por dia).
    [Tags]    DIAG-1183
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Volume de Propostas (Por dia)
    Então o arquivo com o nome do gráfico é salvo com sucesso    Volume de Propostas (Por dia).csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Volume de Propostas (Por hora).
    [Tags]    DIAG-1184
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Volume de Propostas (Por hora)
    Então o arquivo com o nome do gráfico é salvo com sucesso    Volume de Propostas (Por hora).csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Volume de Propostas (Por minuto).
    [Tags]    DIAG-1185
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Volume de Propostas (Por minuto)
    Então o arquivo com o nome do gráfico é salvo com sucesso    Volume de Propostas (Por minuto).csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Volume de Propostas (Por segundo).
    [Tags]    DIAG-1186
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Volume de Propostas (Por segundo)
    Então o arquivo com o nome do gráfico é salvo com sucesso    Volume de Propostas (Por segundo).csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Volume de Propostas por Política (Por dia).
    [Tags]    DIAG-1187
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Volume de Propostas por Política (Por dia)
    Então o arquivo com o nome do gráfico é salvo com sucesso    Volume de Propostas por Política (Por dia).csv

O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Volume de Propostas por Política (Por hora).
    [Tags]    DIAG-1188
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Volume de Propostas por Política (Por hora)
    Então o arquivo com o nome do gráfico é salvo com sucesso    Volume de Propostas por Política (Por hora).csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Volume de Propostas por Política (Por minuto).
    [Tags]    DIAG-1189
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Volume de Propostas por Política (Por minuto)
    Então o arquivo com o nome do gráfico é salvo com sucesso    Volume de Propostas por Política (Por minuto).csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Volume de Propostas por Política (Por segundo).
    [Tags]    DIAG-1190
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Volume de Propostas por Política (Por segundo)
    Então o arquivo com o nome do gráfico é salvo com sucesso    Volume de Propostas por Política (Por segundo).csv


O sistema deve baixar o arquivo com o mesmo nome do tipo de gráfico: Distribuição por Políticas
    [Tags]    DIAG-1056
    GraficoPage.Dado ter selecionado um periodo para consultar
    Quando selecionar o tipo de grafico para download    Distribuição por Políticas
    Então o arquivo com o nome do gráfico é salvo com sucesso    Distribuição por Políticas.csv


Validar tipo de gráfico Distribuição por IP de Servidor é visível para conta neurotech
    [Tags]    DIAG-1616
    GraficoPage.Dado ter selecionado um periodo para consultar
    Então é exibido na lista o gráfico    Distribuição por IP de Servidor


Validar tipo de gráfico Distribuição por IP de Origem é visível para conta neurotech
    [Tags]    DIAG-1617
    GraficoPage.Dado ter selecionado um periodo para consultar
    Então é exibido na lista o gráfico    Distribuição por IP de Origem