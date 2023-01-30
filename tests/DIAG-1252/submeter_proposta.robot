*** Settings ***
Resource    ../../config/mapper.robot

Documentation   Testes Relacionados ao Requisito DIAG-1252

Test Setup    Usuario loga e acessa o produto
Test Teardown    Evidenciar teste na pasta    DIAG-1252



*** Test Cases ***
Submeter política importando CSV 
    [Tags]    DIAG-1253
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E acionado o botão submeter proposta
    E informar a politica    RECEITA_FEDERAL    PROP_CPF
    Quando fizer o upload do arquivo    Entradas.csv
    E acionado o botão submeter proposta
    Então é exibido um toast com a mensagem    finalizada com sucesso!

Validar submissão somente com arquivo CSV
    [Tags]    DIAG-1254
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E acionado o botão submeter proposta
    E informar a politica    RECEITA_FEDERAL    PROP_CPF    
    Quando fizer o upload do arquivo    teste.pdf
    Então é exibido um toast com a mensagem    Extensão de arquivo não suportada! Somente arquivos CSV podem ser importados!

Submissão de política com arquivo importado vazio
    [Tags]    DIAG-1255
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E acionado o botão submeter proposta
    E informar a politica    RECEITA_FEDERAL    PROP_CPF
    Quando fizer o upload do arquivo    Arquivo-vazio.csv
    Então é exibido um toast com a mensagem    O arquivo está vazio!

Submeter política importando CSV com apenas entradas
    [Tags]    DIAG-1384
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E acionado o botão submeter proposta
    E informar a politica    RECEITA_FEDERAL    PROP_CPF
    Quando fizer o upload do arquivo    Apenas-entradas.csv
    E acionado o botão submeter proposta
    Então é exibido um toast com a mensagem    finalizada com sucesso!

Importar CSV e modificando valores antes da submissão
    [Tags]    DIAG-1385
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E acionado o botão submeter proposta
    E informar a politica    RECEITA_FEDERAL    PROP_CPF
    Quando fizer o upload do arquivo    Entradas.csv
    E modificar os valores da proposta    PROP_CPF    13078263780
    E acionado o botão submeter proposta
    Então é exibido um toast com a mensagem    finalizada com sucesso!

Adicionar entrada antes de submeter proposta
    [Tags]    DIAG-1040
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E acionado o botão submeter proposta
    E informar a politica    RECEITA_FEDERAL    PROP_CPF
    Quando adicionar uma nova entrada    ENTRADA_TESTE
    E acionado o botão submeter proposta
    Então é exibido um toast com a mensagem    finalizada com sucesso!

Submeter Proposta com sucesso
    [Tags]    DIAG-1042
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E acionado o botão submeter proposta
    E informar a politica    RECEITA_FEDERAL    PROP_CPF
    E acionado o botão submeter proposta
    Então é exibido um toast com a mensagem    finalizada com sucesso!

Remover entrada antes de submeter proposta
    [Tags]    PENDENTE
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E acionado o botão submeter proposta
    E informar a politica    RECEITA_FEDERAL    PROP_CPF
    Quando remover uma entrada    PROP_NOME
    E acionado o botão submeter proposta
    Então é exibido um toast com a mensagem    finalizada com sucesso!