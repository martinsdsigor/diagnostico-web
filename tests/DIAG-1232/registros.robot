*** Settings ***
Resource            ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1232


*** Test Cases ***
Coluna Código de Operação no detalhamento dos registros
    [Tags]    DIAG-1231
    Dado que esteja na tela inicial Detalhamento
    E visualizar a mensagem "Abra os filtros e faça uma busca."
    Quando acionar Filtros
    E informar um período    13/01/2023
    Então os resultados devem ser filtrados de acordo com o período    13/01/2023
    E Cód. Operação deve estar visivel como terceira coluna

Ordernar resultados por Cód. Operação
    [Tags]    DIAG-461
    Dado que esteja na tela inicial Detalhamento
    E visualizar a mensagem "Abra os filtros e faça uma busca."
    Quando acionar Filtros
    E informar um período    13/01/2023
    Quando acionar a coluna    Cód. Operação
    Então o sistema deve ordernar os resultados    coluna=3    ordem=crescente
    E exibir uma seta apontada para cima próximo ao nome    Cód. Operação
    Quando acionar a coluna    Cód. Operação
    Então o sistema deve ordernar os resultados    coluna=3    ordem=decrescente
    E exibir uma seta apontada para baixo próximo ao nome    Cód. Operação
    Quando acionar a coluna    Cód. Operação
    Então o sistema ordenará por Data mais recente
    E não exibirá uma seta ao lado do nome    Cód. Operação

Ordernar resultados por Data/Hora
    [Tags]    DIAG-463
    Dado que esteja na tela inicial Detalhamento
    E visualizar a mensagem "Abra os filtros e faça uma busca."
    Quando acionar Filtros
    E informar um período    13/01/2023
    Quando acionar a coluna    Data/Hora
    Então o sistema deve ordernar os resultados    coluna=5    ordem=crescente
    E exibir uma seta apontada para cima próximo ao nome    Data/Hora
    Quando acionar a coluna    Data/Hora
    Então o sistema deve ordernar os resultados    coluna=5    ordem=decrescente
    E exibir uma seta apontada para baixo próximo ao nome    Data/Hora
    Quando acionar a coluna    Data/Hora
    Então o sistema ordenará por Data mais recente
    E não exibirá uma seta ao lado do nome    Data/Hora

Ordernar resultados por Cliente
    [Tags]    DIAG-464
    Dado que esteja na tela inicial Detalhamento
    E visualizar a mensagem "Abra os filtros e faça uma busca."
    Quando acionar Filtros
    E informar um período    13/01/2023
    Quando acionar a coluna    Cliente
    Então o sistema deve ordernar os resultados    coluna=2    ordem=crescente
    E exibir uma seta apontada para cima próximo ao nome    Cliente
    Quando acionar a coluna    Cliente
    Então o sistema deve ordernar os resultados    coluna=2    ordem=decrescente
    E exibir uma seta apontada para baixo próximo ao nome    Cliente
    Quando acionar a coluna    Cliente
    Então o sistema ordenará por Data mais recente
    E não exibirá uma seta ao lado do nome    Cliente

Ordernar resultados por Política
    [Tags]    DIAG-465
    Dado que esteja na tela inicial Detalhamento
    E visualizar a mensagem "Abra os filtros e faça uma busca."
    Quando acionar Filtros
    E informar um período    13/01/2023
    Quando acionar a coluna    Política
    Então o sistema deve ordernar os resultados    coluna=6    ordem=crescente
    E exibir uma seta apontada para cima próximo ao nome    Política
    Quando acionar a coluna    Política
    Então o sistema deve ordernar os resultados    coluna=6    ordem=decrescente
    E exibir uma seta apontada para baixo próximo ao nome    Política
    Quando acionar a coluna    Política
    Então o sistema ordenará por Data mais recente
    E não exibirá uma seta ao lado do nome    Política

Ordernar resultados por Resultado
    [Tags]    DIAG-467
    Dado que esteja na tela inicial Detalhamento
    E visualizar a mensagem "Abra os filtros e faça uma busca."
    Quando acionar Filtros
    E informar um período    13/01/2023
    Quando acionar a coluna    Resultado
    Então o sistema deve ordernar os resultados    coluna=8    ordem=crescente
    E exibir uma seta apontada para cima próximo ao nome    Resultado
    Quando acionar a coluna    Resultado
    Então o sistema deve ordernar os resultados    coluna=8    ordem=decrescente
    E exibir uma seta apontada para baixo próximo ao nome    Resultado
    Quando acionar a coluna    Resultado
    Então o sistema ordenará por Data mais recente
    E não exibirá uma seta ao lado do nome    Resultado

Ordernar resultados por Proposta
    [Tags]    DIAG-462
    Dado que esteja na tela inicial Detalhamento
    E visualizar a mensagem "Abra os filtros e faça uma busca."
    Quando acionar Filtros
    E informar um período    13/01/2023
    Quando acionar a coluna    Proposta
    Então o sistema deve ordernar os resultados    coluna=4    ordem=crescente
    E exibir uma seta apontada para cima próximo ao nome    Proposta
    Quando acionar a coluna    Proposta
    Então o sistema deve ordernar os resultados    coluna=4    ordem=decrescente
    E exibir uma seta apontada para baixo próximo ao nome    Proposta
    Quando acionar a coluna    Proposta
    Então o sistema ordenará por Data mais recente
    E não exibirá uma seta ao lado do nome    Proposta

Ordernar resultados por Sucesso
    [Tags]    DIAG-466
    Dado que esteja na tela inicial Detalhamento
    E visualizar a mensagem "Abra os filtros e faça uma busca."
    Quando acionar Filtros
    E informar um período    13/01/2023
    Quando acionar a coluna    Sucesso
    Então o sistema deve ordernar os resultados    coluna=7    ordem=crescente
    E exibir uma seta apontada para cima próximo ao nome    Sucesso
    Quando acionar a coluna    Sucesso
    Então o sistema deve ordernar os resultados    coluna=7    ordem=decrescente
    E exibir uma seta apontada para baixo próximo ao nome    Sucesso
    Quando acionar a coluna    Sucesso
    Então o sistema ordenará por Data mais recente
    E não exibirá uma seta ao lado do nome    Sucesso
