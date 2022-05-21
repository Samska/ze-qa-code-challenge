*** Settings ***
Library         FakerLibrary    locale=pt_BR

*** Variables ***
${CRIAR_CONTA_LINK}             id:create-account-link 
${BUTTON_ENTRAR}                id:welcome-button-sign-in
${NOME_COMPLETO}                id:signup-form-input-name
${EMAIL}                        id:signup-form-input-email
${SENHA}                        id:signup-form-input-password
${CPF}                          id:signup-form-input-document
${CELULAR}                      id:signup-form-input-phone
${DATA_NASCIMENTO}              id:signup-form-input-age
${TERMOS}                       id:sign-up-form-input-terms
${BUTTON_CRIAR_CONTA}           id:signup-form-button-signup
${BUTTON_VALIDAR_DEPOIS}        id:confirm-phone-link-validate-later
${TENHO_CONTA_LINK}             id:signup-form-link-have-account

*** Keywords ***
Executar a keyword ate ter sucesso
        [Arguments]     ${KW}           ${KWARGS}
        Wait Until Keyword Succeeds     10s     1s      ${KW}   ${KWARGS}

Dado que esteja na página de cadastro
        Click Button                            ${BUTTON_ENTRAR} 
        Wait Until Page Contains                Quero criar uma conta
        Executar a keyword ate ter sucesso      Click Link           ${CRIAR_CONTA_LINK}  
        Wait Until Page Contains                Criar conta com e‑mail e senha

Quando preencher o formulário com dados validos
        ${NOME_FAKE}                    FakerLibrary.First Name
        ${SOBRENOME_FAKE}               FakerLibrary.Last Name
        ${NOME_CATENATE}                Catenate                ${NOME_FAKE}    ${SOBRENOME_FAKE}         
        ${EMAIL_FAKE}                   FakerLibrary.Email
        ${SENHA_FAKE}                   FakerLibrary.Password           length=8
        ${SENHA_CATENATE}               Catenate                ${SENHA_FAKE}%$#@
        ${CPF_FAKE}                     FakerLibrary.Cpf               
        ${DIA_FAKE}                     FakerLibrary.Day Of Month
        ${MES_FAKE}                     FakerLibrary.Month
        ${ANO_FAKE}                     FakerLibrary.Year
        ${DATA_NASCIMENTO_CATENATE}     Catenate                ${DIA_FAKE}     ${MES_FAKE}     1996    
        Input Text                      ${NOME_COMPLETO}        ${NOME_CATENATE}                                         
        Input Text                      ${EMAIL}                ${EMAIL_FAKE}                                         
        Input Text                      ${SENHA}                ${SENHA_CATENATE}                                         
        Input Text                      ${CPF}                  ${CPF_FAKE}                                         
        Input Text                      ${CELULAR}              11999999999
        Input Text                      ${DATA_NASCIMENTO}      ${DATA_NASCIMENTO_CATENATE}

E aceitar os termos e condições
        Wait Until Element Is Enabled           ${TERMOS}
        Checkbox Should Not Be Selected         ${TERMOS}
        Executar a keyword ate ter sucesso      Select Checkbox           ${TERMOS}       

E clicar em criar conta
        Wait Until Element Is Enabled           ${BUTTON_CRIAR_CONTA}
        Executar a keyword ate ter sucesso      Click Element           ${BUTTON_CRIAR_CONTA}                        

E preencher o campo "${CAMPO}" com "${VALOR}"
        Sleep           2s
        Press Keys      css=[aria-label*=${CAMPO}]      CTRL+a+BACKSPACE
        Input Text      css=[aria-label*=${CAMPO}]      ${VALOR}                               

Então deve ser redirecionado para pagina de validar o celular        
        Wait Until Page Contains                Validar celular
        Wait Until Element Is Enabled           ${BUTTON_VALIDAR_DEPOIS}

Então a pagina deve exibir "${MENSAGEM}"
        Wait Until Page Contains        ${MENSAGEM}
        Page Should Contain             ${MENSAGEM}