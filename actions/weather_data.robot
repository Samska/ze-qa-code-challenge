*** Settings ***
Resource                ../resources/api_resource.robot

*** Keywords ***
#### DADO
Dado que esteja conectado no webservice Open Weather
        Conecta ao WebService

Quando realizar a consulta com a cidade "${CIDADE_CONSULTADA}"
        Realiza requisição por cidade   ${CIDADE_CONSULTADA}

Quando realizar a consulta com uma API key invalida
        Realiza requisição com API key invalida

Então a condição metereológica deve ser retornada        
        Confere o clima

Então a mensagem "${MENSAGEM}" deve ser retornada
        Confere a mensagem          ${MENSAGEM}

E o status code deve ser "${STATUS_CODE}"
        Confere o status code       ${STATUS_CODE}