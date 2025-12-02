*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Dado que eu acesse o Organo e maximizo a tela
    Open Browser    url=http://localhost:3000/    browser=Chrome
    Maximize Browser Window

Fechar navegador
    Close Browser