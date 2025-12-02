*** Settings *** 
Library          SeleniumLibrary
Resource         setup_teardown.robot                                                     ##linkando o arquivo setup teardown com esse para definir padroes
Test Setup       Dado que eu acesse o Organo e maximizo a tela                            ## Define que o Setup Acessar o organo acontecerá no inicio de cada teste
Test Teardown    Fechar navegador                                                         ## Define que o Tear Down Fechar navegador ocorre no final de cada teste
*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao 
${PROGRAMACAO}     //option[contains(.,'Programação')]
${FRONT-END}       //option[contains(.,'Front-End')]
${DADOS}           //option[contains(.,'Data Science')]
${DEVOPS}          //option[contains(.,'Devops')]
${UX}              //option[contains(.,'UX e Design')]
${MOBILE}          //option[contains(.,'Mobile')]
${INOVACAO}        //option[contains(.,'Inovação')]


*** Test Cases ***
Verificar preenchimento do formulário + criação do card
    Dado que eu preencha os campos do formulário corretamente
    E clique no botão criar card
    Então o sistema cria um novo card com as informações passadas no formulário 


*** Keywords ***
Dado que eu preencha os campos do formulário corretamente
    Input Text       ${CAMPO_NOME}      Lucas
    Input Text       ${CAMPO_CARGO}     QA
    Input Text       ${CAMPO_IMAGEM}    https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}
    Click Element    ${PROGRAMACAO}  
    Sleep    10s  
E clique no botão criar card
    Click Element    ${CAMPO_CARD}
 Então o sistema cria um novo card com as informações passadas no formulário
    Element Should Be Visible    class:colaborador
    Scroll Element Into View    class:colaborador
    Sleep    5s

