*** Settings ***
Resource            ../config/mapper.robot

Test Setup          Usuario ter acessado o sistema
Test Teardown       Evidenciar teste na pasta    login


*** Test Cases ***
Login realizado com sucesso
    [Tags]    DIAG-1243
    Quando o usuario informar as credenciais    ${USERNAME}    ${PASSWORD}
    Então a página com os produtos riskpack é visualizada
    
