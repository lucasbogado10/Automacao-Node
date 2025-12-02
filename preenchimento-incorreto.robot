*** Settings *** 
Library          SeleniumLibrary
Resource         setup_teardown.robot                                                     ##linkando o arquivo setup teardown com esse para definir padroes
Test Setup       Dado que eu acesse o Organo e maximizo a tela                            ## Define que o Setup Acessar o organo acontecerá no inicio de cada teste
Test Teardown    Fechar navegador                                                         ## Define que o Tear Down Fechar navegador ocorre no final de cada teste

*** Variables ***
${CAMPO_CARD}      id:form-botao 
${NOME_ERRO}       id:form-nome-erro
${CARGO_ERRO}      id:form-cargo-erro
${TIME_ERRO}       id:form-times-erro

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente, o sistema exibe mensagem de erro
    Dado que eu clique no botão criar card

    Então sistema exibe mensagem de erro

*** Keywords ***
Dado que eu clique no botão criar card
    Sleep    5s
    Click Element     ${CAMPO_CARD}

Então sistema exibe mensagem de erro
    Element Should Be Visible    ${NOME_ERRO}
    Element Should Be Visible    ${CARGO_ERRO}
    Element Should Be Visible    ${TIME_ERRO}
    Sleep    5s
