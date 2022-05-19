*** Settings ***
Library     SeleniumLibrary
Resource    pages/register.robot

*** Variables ***
${BROWSER}                      edge
${URL}                          https://www.ze.delivery/
${COOKIES}                      id:onetrust-button-group 
${BUTTON_ACEITAR_COOKIES}       id:onetrust-accept-btn-handler
${TITULO_HOME}                  Zé Delivery: Entrega de bebidas geladas a preço baixo 

*** Keywords ***
Abrir o navegador no Ze Delivery e aceitar os cookies
        Open Browser                            ${URL}     ${BROWSER}   options=add_experimental_option("excludeSwitches", ["enable-logging"])
        Maximize Browser Window
        Title Should Be                         ${TITULO_HOME}
        Wait Until Element Is Visible           ${COOKIES}    
        Executar a keyword ate ter sucesso      Click Button            ${BUTTON_ACEITAR_COOKIES}            

Fechar o navegador
        Close Browser
