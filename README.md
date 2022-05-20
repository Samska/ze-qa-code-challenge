# Desafio de QA

# Fluxos críticos escolhidos

i. Cadastro:

Para concluir compras, visualizar pedidos, cupons e ter rastreabilidade de tudo que o cliente executa na plataforma é necessário que ele possua um cadastro.

ii. Adicionar e remover produtos da sacola:

Para comprar um ou mais produtos o cliente precisa adicionar eles a sacola, da mesma forma deve ser possível remover os produtos, caso não goste ou não queira algum deles.

iii. Finalizar compra:

Este com certeza seria o fluxo mais crítico, mesmo que o usuário possua cadastro, tenha selecionado os produtos e adicionado a sacola, se o fluxo de finalizar compra não estiver funcionando corretamente, a compra não vai ser concluída.

# Teste de Automação UI

Nesta etapa, escolhi criar uma suite de testes web do cenário de cadastro, usando Robot Framework + SeleniumLibrary.

Para configurar e executar o projeto localmente você vai precisar do Python instalado e configurado no PATH (caso sua máquina seja windows). Você também vai precisar de um webdriver no path da sua máquina, o webdriver utilizado neste projeto está na pasta webdriver, caso sua máquina seja windows, basta copiar e colar esse arquivo em C:\Windows (ou qual diretório estiver sua pasta Windows). Os outros passos estão a seguir:

Instalar o Robot Framework com o pip:
pip install robotframework

Instalar o SeleniumLibrary com o pip:
pip install robotframework-seleniumlibrary

Instalar o FakerLibrary para gerar dados de forma dinâmica:
pip install robotframework-faker

Executar os testes web através da raiz do projeto e gerar os logs:
robot -d ./logs tests/web\

# Teste de Automação API

Nesta etapa, escolhi criar uma suite de testes de API usando Robot Framework + RequestLibrary.

Se você já tiver configurado os testes de UI, nessa etapa só vai precisar configurar o RequestLibrary:

Instalar o RequestLibrary com o pip:
pip install robotframework-requests

Executar os testes de api através da raiz do projeto e gerar os logs:
robot -d ./logs tests/api\