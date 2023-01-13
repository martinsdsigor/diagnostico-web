*** Settings ***
Documentation       Components para Tabela

Resource            ../config/mapper.robot


*** Keywords ***
Selecionar primeiro registro da consulta
    Wait Until Element Is Enabled    ${checkbox_primeiro_registro}    ${IMPLICITY_WAIT}
    Click Element    ${checkbox_primeiro_registro}


