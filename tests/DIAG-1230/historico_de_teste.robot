*** Settings ***
Documentation       [WKF] Diagnóstico > Submissão > Histórico de teste

Resource            ../../config/mapper.robot

Test Setup          Usuario loga e acessa o produto
Test Teardown       Evidenciar teste na pasta    DIAG-1230


*** Test Cases ***
Validar ordenação na coluna enviado/concluído
    [Tags]    DIAG-1140
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/12/2022    1/02/2023
    Quando acionar a coluna    Enviado / Concluído
    SubmissionPage.Então o sistema deve ordernar os resultados    6    crescente

Validar ordenação na coluna Nome
    [Tags]    DIAG-1747
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/12/2022    1/02/2023
    Quando acionar a coluna    Nome
    SubmissionPage.Então o sistema deve ordernar os resultados    2    crescente

Validar ordenação na coluna ID do teste
    [Tags]    DIAG-1748
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/12/2022    1/02/2023
    Quando acionar a coluna    ID do teste
    SubmissionPage.Então o sistema deve ordernar os resultados    3    crescente

Validar ordenação na coluna Usuário
    [Tags]    DIAG-1749
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/12/2022    1/02/2023
    Quando acionar a coluna    Usuário
    SubmissionPage.Então o sistema deve ordernar os resultados    4    crescente

Validar ordenação na coluna Política
    [Tags]    DIAG-1750
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/12/2022    1/02/2023
    Quando acionar a coluna    Política
    SubmissionPage.Então o sistema deve ordernar os resultados    5    crescente

Validar ordenação na coluna Início
    [Tags]    DIAG-1751
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/12/2022    1/02/2023
    Quando acionar a coluna    Início
    SubmissionPage.Então o sistema deve ordernar os resultados    7    crescente

Validar ordenação na coluna Status
    [Tags]    DIAG-1752
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/12/2022    1/02/2023
    Quando acionar a coluna    Status
    SubmissionPage.Então o sistema deve ordernar os resultados    8    crescente

Validar quantidade de 20 itens por paginação
    [Tags]    DIAG-1753
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Então a quantidade de propostas deve ser igual a    1 - 20

Validar quantidade de 40 itens por paginação
    [Tags]    DIAG-1754
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    SubmissionPage.Quando informar a quantidade de propostas    40
    Então a quantidade de propostas deve ser igual a    1 - 40

Validar quantidade de 80 itens por paginação
    [Tags]    DIAG-1755
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/01/2016    17/02/2023
    SubmissionPage.Quando informar a quantidade de propostas    80
    Então a quantidade de propostas deve ser igual a    1 - 80

Validar botão última página
    [Tags]    DIAG-1756
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Quando acionar botão    Última página
    Então deve ser exibida a última página de resultados da busca

Validar botão Voltar página
    [Tags]    DIAG-1757
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Quando acionar botão    Próximo
    Então a quantidade de propostas deve ser igual a    21 - 40
    Quando acionar botão    Anterior
    Então a quantidade de propostas deve ser igual a    1 - 20

Validar botão Próxima página
    [Tags]    DIAG-1758
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Quando acionar botão    Próximo
    Então a quantidade de propostas deve ser igual a    21 - 40

Validar botão Primeira página
    [Tags]    DIAG-1759
    Dado que esteja na tela inicial Submissão
    Quando acionar Filtros
    E informar um período    1/02/2022    1/02/2023
    Quando acionar botão    Próximo
    Então os botões "Primeira página" e "Voltar página" ficarão habilitados
    Quando acionar botão    Primeira página
    Então a quantidade de propostas deve ser igual a    1 - 20
