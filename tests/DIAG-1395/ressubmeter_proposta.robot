*** Settings ***
Resource    ../../config/mapper.robot

Documentation   Testes Relacionados ao Requisito DIAG-1395

Test Setup    Usuario loga e acessa o produto
Test Teardown    Evidenciar teste na pasta    DIAG-1395


*** Test Cases ***
Ressubmeter proposta importando CSV
    [Tags]    DIAG-1396
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E selecionado o primeiro registro retornado
    E clicar em ressubmeter
    ResubmissionPage.E informar a politica    POLITICA_DAVO    PROP_CPF
    Quando fizer o upload do arquivo    Entradas.csv
    E acionado o botão submeter proposta
    ResubmissionPage.Então é exibido um toast com a mensagem    finalizada com sucesso!


Ressubmissão de política importando arquivo vazio
    [Tags]    DIAG-1397
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E selecionado o primeiro registro retornado
    E clicar em ressubmeter
    ResubmissionPage.E informar a politica    POLITICA_DAVO    PROP_CPF
    Quando fizer o upload do arquivo    Arquivo-vazio.csv
    ResubmissionPage.Então é exibido um toast com a mensagem    O arquivo está vazio!


Validar ressubmissão somente com arquivo CSV
    [Tags]    DIAG-1398
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E selecionado o primeiro registro retornado
    E clicar em ressubmeter
    ResubmissionPage.E informar a politica    POLITICA_DAVO    PROP_CPF
    Quando fizer o upload do arquivo    teste.pdf
    ResubmissionPage.Então é exibido um toast com a mensagem    Extensão de arquivo não suportada! Somente arquivos CSV podem ser importados!


Ressubmissão com sucesso
    [Tags]    DIAG-1043
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E selecionado o primeiro registro retornado
    E clicar em ressubmeter
    ResubmissionPage.E informar a politica    POLITICA_DAVO    PROP_CPF
    E acionado o botão submeter proposta
    ResubmissionPage.Então é exibido um toast com a mensagem    finalizada com sucesso!


Adicionar entrada antes de submeter proposta
    [Tags]    DIAG-XXXX
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E selecionado o primeiro registro retornado
    E clicar em ressubmeter
    ResubmissionPage.E informar a politica    POLITICA_DAVO    PROP_CPF
    Quando adicionar uma nova entrada    ENTRADA_TESTE
    E acionado o botão submeter proposta
    ResubmissionPage.Então é exibido um toast com a mensagem    finalizada com sucesso!


Remover entrada antes de submeter proposta
    [Tags]    DIAG-XXXX
    DetalhamentoPage.Dado ter selecionado um periodo para consultar
    E selecionado o primeiro registro retornado
    E clicar em ressubmeter
    ResubmissionPage.E informar a politica    BATCH_TST    PROP_CPF
    Quando remover uma entrada    PROP_NOME
    E acionado o botão submeter proposta
    ResubmissionPage.Então é exibido um toast com a mensagem    finalizada com sucesso!