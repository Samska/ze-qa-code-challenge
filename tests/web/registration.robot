*** Settings ***
Resource                ../../web_resource.robot
Resource                ../../actions/registration.robot
Test Setup              Abrir o navegador no Ze Delivery e aceitar os cookies
Test Teardown           Fechar o navegador

*** Test Case ***
Cenário 01: Cadastro feito com sucesso
        Dado que esteja na página de cadastro
        Quando preencher o formulário com dados validos
        E aceitar os termos e condições
        E clicar em criar conta
        Então deve ser redirecionado para pagina de validar o celular

Cenário 02: Celular já registrado
        Dado que esteja na página de cadastro
        Quando preencher o formulário com dados validos
        E preencher o campo "Celular" com "11983168056"
        E aceitar os termos e condições
        E clicar em criar conta
        Então a pagina deve exibir "Esse celular já está registrado"

Cenário 03: Email já registrado
        Dado que esteja na página de cadastro
        Quando preencher o formulário com dados validos
        E preencher o campo "E-mail" com "samuel.andradetp@live.com"
        E aceitar os termos e condições
        E clicar em criar conta
        Então a pagina deve exibir "Esse email já está registrado"
