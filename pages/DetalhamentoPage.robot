*** Settings ***
Resource    ../config/mapper.robot


*** Keywords ***
Dado ter selecionado um periodo para consultar
    Acionar Filtros
    Informar Período por data    11/01/2023
    Acionar Consultar

E selecionado o primeiro registro retornado
    Selecionar primeiro registro da consulta

E acionado o botão submeter proposta
    Wait Until Element Is Enabled    ${btn_submeter_proposta}    ${IMPLICITY_WAIT}
    Sleep    1s
    Click Element    ${btn_submeter_proposta}


