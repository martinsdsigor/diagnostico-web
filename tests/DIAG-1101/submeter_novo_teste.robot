*** Settings ***
Documentation       [WKF] Diagnóstico > Submissão > Novo Teste

Resource            ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1101

*** Test Cases ***
Submeter novo teste com sucesso
    [Tags]    DIAG-1436
    Dado que esteja na tela inicial Submissão
    Quando acionar Novo teste
    Então o sistema exibirá um modal para submissão do novo teste
    E botão "Testar política" desabilitado
    Quando inserir no campo 'Nome do teste' um nome do teste    TESTE_AUTOMATIZADO
    E selecionar a política desejada    BATCH_TST
    E selecionar o campo chave desejado    PROP_CPF
    E acionar o botão Importar massa de dados
    E selecine o arquivo    RECEITA_15.csv
    Então o sistema deverá exibir o nome do arquivo ao invés do botão "Importar massa de dados"
    E botão "Testar política" habilitado
    Quando acionar o botão "Testar política"
    Então é exibido um toast com a mensagem informada    Enviado com sucesso!
    E exibir a tela de submissão aplicando o filtro por id da submissão de teste
    E exibir o registro da submissão com status    Provisionando

Submeter novo teste, cancelar e submeter novo teste novamente
    [Tags]    DIAG-1444
    Dado que esteja na tela inicial Submissão
    Quando acionar Novo teste
    Então o sistema exibirá um modal para submissão do novo teste
    E botão "Testar política" desabilitado
    Quando inserir no campo 'Nome do teste' um nome do teste    TESTE_AUTOMATIZADO
    E selecionar a política desejada    BATCH_TST
    E selecionar o campo chave desejado    PROP_CPF
    E acionar o botão "Cancelar"
    Quando acionar Novo teste
    Então o sistema exibirá um modal para submissão do novo teste
    E botão "Testar política" desabilitado
    Quando inserir no campo 'Nome do teste' um nome do teste    TESTE_AUTOMATIZADO
    E selecionar a política desejada    BATCH_TST
    E selecionar o campo chave desejado    PROP_CPF
    E acionar o botão Importar massa de dados
    E selecine o arquivo    RECEITA_15.csv
    Então o sistema deverá exibir o nome do arquivo ao invés do botão "Importar massa de dados"
     E botão "Testar política" habilitado
     Quando acionar o botão "Testar política"
     Então é exibido um toast com a mensagem informada    Enviado com sucesso!
     E exibir a tela de submissão aplicando o filtro por id da submissão de teste
     E exibir o registro da submissão com status    Provisionando

Validar Novo Teste em Submissão inválido
    [Tags]    DIAG-1041
    Dado que esteja na tela inicial Submissão
    Quando acionar Novo teste
    Então o sistema exibirá um modal para submissão do novo teste
    E botão "Testar política" desabilitado
    Quando inserir no campo 'Nome do teste' um nome do teste    TESTE_AUTOMATIZADO
    E selecionar a política desejada    BATCH_TST
    E selecionar o campo chave desejado    PROP_CPF
    E acionar o botão Importar massa de dados
    E selecine o arquivo    teste.pdf
    Então o botão "Testar política" permanece desabilitado

Submeter novo teste com arquivo CSV com mais de 1500 linhas
    [Tags]    DIAG-xxxx
    Dado que esteja na tela inicial Submissão
    Quando acionar Novo teste
    Então o sistema exibirá um modal para submissão do novo teste
    E botão "Testar política" desabilitado
    Quando inserir no campo 'Nome do teste' um nome do teste    TESTE_AUTOMATIZADO
    E selecionar a política desejada    BATCH_TST
    E selecionar o campo chave desejado    PROP_CPF
    E acionar o botão Importar massa de dados
    E selecine o arquivo    massa_rfpf_1600_regular.csv
    Então o sistema deverá exibir o nome do arquivo ao invés do botão "Importar massa de dados"
     E botão "Testar política" habilitado
     Quando acionar o botão "Testar política"
     Então é exibido um toast com a mensagem informada    Arquivo de entrada maior do que o permitido: A quantidade de linhas do arquivo

Validar que a submissão de novo teste só aceita arquivo CSV
    [Tags]    DIAG-yyyy
    Dado que esteja na tela inicial Submissão
    Quando acionar Novo teste
    Então o sistema exibirá um modal para submissão do novo teste
    E botão "Testar política" desabilitado
    Quando inserir no campo 'Nome do teste' um nome do teste    TESTE_AUTOMATIZADO
    E selecionar a política desejada    BATCH_TST
    E selecionar o campo chave desejado    PROP_CPF
    E acionar o botão Importar massa de dados
    E selecine o arquivo    RECEITA_15.csv
    Então o sistema deverá exibir o nome do arquivo ao invés do botão "Importar massa de dados"
    E botão "Testar política" habilitado
