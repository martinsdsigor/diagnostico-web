*** Settings ***
Resource    ../../config/mapper.robot

Documentation   Testes Relacionados ao Requisito DIAG-1664

Test Setup    Usuario loga e acessa o produto
Test Teardown    Evidenciar teste na pasta    DIAG-1664


*** Test Cases ***
Baixar entradas de um registro com resultado de reprovado
        [Tags]    DIAG-1379
        Dado ter selecionado um periodo informando política e resultado    BATCH_TST    REPROVADO
        E quando acionar os 3 pontos ao final da primeira proposta
        Quando clicar em    Baixar Entradas
        Então o download de um csv contendo as entradas deve ser concluído 


Baixar entradas de um registro com resultado de aprovado
        [Tags]    DIAG-1378
        Dado ter selecionado um periodo informando política e resultado    TESTE_CARGA    APROVADO
        E quando acionar os 3 pontos ao final da primeira proposta
        Quando clicar em    Baixar Entradas
        Então o download de um csv contendo as entradas deve ser concluído 


Baixar entradas de um registro com resultado de pendente
        [Tags]    DIAG-1380
        Dado ter selecionado um periodo informando política e resultado    TESTE_CARGA    PENDENTE
        E quando acionar os 3 pontos ao final da primeira proposta
        Quando clicar em    Baixar Entradas
        Então o download de um csv contendo as entradas deve ser concluído 
        
        