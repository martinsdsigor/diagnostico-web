*** Settings ***
Documentation       Components para Tabela

Resource            ../config/mapper.robot


*** Keywords ***
Selecionar primeiro registro da consulta
    Wait Until Element Is Enabled    ${checkbox_primeiro_registro}    ${IMPLICITY_WAIT}
    Click Element    ${checkbox_primeiro_registro}


Retornar codigo da operacao selecionado
    ${cod_ope_table_value}    Get Text    ${detalhamento_table_resultados}/td[3]/span
    Set Suite Variable    ${detalhamento_cod_operacao}    ${cod_ope_table_value}