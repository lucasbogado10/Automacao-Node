*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
##setup
Dado que eu acesse o Organo e maximizo a tela
    Open Browser    url=http://localhost:3000/    browser=Chrome
    Maximize Browser Window


##teardown
Fechar navegador                                                        
    Close Browser

