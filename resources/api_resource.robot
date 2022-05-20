*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variable ***
${HOST}         https://api.openweathermap.org/data/2.5/weather
${APP_KEY}      0309b15c3c7fd25bc276675da66e9c05
${LANG}         pt_br

*** Keywords ***
Conecta ao WebService
        Create Session      OpenWeather     ${HOST}     disable_warnings=True

Realiza requisição por cidade
        [Arguments]         ${CIDADE_CONSULTADA}
        ${RESPOSTA}=        Get Request  OpenWeather  /?q=${CIDADE_CONSULTADA}&appid=${APP_KEY}&${LANG}
        Log                 Resposta: ${RESPOSTA.text}
        Set Test Variable   ${RESPOSTA}

Realiza requisição com API key invalida
        ${RESPOSTA}=        Get Request  OpenWeather  /?appid=invalidApiKey
        Log                 Resposta: ${RESPOSTA.text}
        Set Test Variable   ${RESPOSTA}

Confere o clima
        Dictionary Should Contain Key  ${RESPOSTA.json()}  weather

Confere o status code
        [Arguments]     ${STATUS_ESPERADO}
        Should Be Equal As Strings   ${RESPOSTA.status_code}  ${STATUS_ESPERADO}
        Log             Status Code Retornado: ${RESPOSTA.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}

Confere a mensagem
        [Arguments]         ${MENSAGEM}
        Dictionary Should Contain Item  ${RESPOSTA.json()}  message    ${MENSAGEM}