*** Settings ***
Resource                ../../resources/api_resource.robot
Resource                ../../steps/weather_data.robot

*** Test Case ***
Cenário 01: Consulta de clima por cidade
    Dado que esteja conectado no webservice Open Weather
    Quando realizar a consulta com a cidade "São Paulo"
    Então a condição metereológica deve ser retornada
    E o status code deve ser "200"

Cenário 02: Consulta de clima por cidade inexistente
    Dado que esteja conectado no webservice Open Weather
    Quando realizar a consulta com a cidade "teste"
    Então a mensagem "city not found" deve ser retornada
    E o status code deve ser "404"

Cenário 02: Consulta de clima com API key invalida
    Dado que esteja conectado no webservice Open Weather
    Quando realizar a consulta com uma API key invalida
    Então a mensagem "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info." deve ser retornada
    E o status code deve ser "401"