# Implementação Flutter

- Esse projeto visa permitir ao usuário ele buscar um prato de culinária, e a partir desse prato receitas são buscadas, o usuário escolhe uma dessas receitas e consegue visualizar os detalhes, como modo de preparo, fotos e ingredientes.

- Esse projeto tem como objetivo implementar uma aplicação em flutter. Tendo como requisitos mínimos os itens abaixo.
  - Conter implementação de Layout com ao menos duas telas.
  - Uso de textos, botões, listas, recursos de ao menos 4 widgets diferentes).
  - Usar algum dos Recursos (LocalStorage, Câmera, API, Sensores)
    - Nesse trabalho foi optado por utilizar API.

# Ferramentas utilizadas 

- IDE: Android Studio.

# Configuração

- Necessário baixar o flutter.
- Necessário baixar o android studio, ou outra ide de sua preferência.
- Necessário baixar as de acordo com o arquivo pubspec.yaml.
- Possuir api key da spoonacular API.

# API spoonacular API

- É uma api gratuíta para consultar pratos e suas receitas.

- Exemplos de pratos que você pode pesquisar:
1. Pizza
2. Sushi
3. Tacos
4. Sopa
5. Arroz

# Requisitos solicitados pelo Professor, aonde foram usados ?

- Implementação de Layout com ao menos duas telas.
  - Tela de Busca, onde é possível buscar um produto e verificar possíveis receitas.
  - Tela de Detalhes da Receita.

- Uso de textos, botões, listas, recursos de ao menos 4 widgets diferentes).
  - TextField: Permite ao usuário digitar o nome da receita.
  - ElevatedButton: Usado para acionar a busca de receitas.
  - ListView.builder: Exibe a lista de receitas encontradas.
  - ListTile: Utilizado para cada item na lista de receitas, incluindo imagem e título.
  - CircularProgressIndicator: Indica carregamento durante a busca ou carregamento de detalhes.
  - Image.network: Carrega e exibe imagens diretamente da internet.

- Uso de algum dos recursos (LocalStorage, Câmera, API, Sensores).
  - O aplicativo utiliza uma API externa (Spoonacular API) para buscar informações sobre receitas e detalhes específicos.