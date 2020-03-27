# Desafio Nobordist

Passos necessários para executar a aplicação:

* Versão do Ruby 2.6.5

* Versão do Rails 5.2.4.2

* Dependências

  - Sqlite (banco de dados para o Active Record)
  - Devise (Prover autenticação para a API)
  - Devise Simple Token (Extensão do Devise para gerenciar tokens de autenticação)
  - Faker (Usado para popular o banco de dados)

* Instruções para deploy

  - git clone https://github.com/celsofilho82/desafio-nobordist-api.git
  - cd desafio-nobordist-api
  - bundle install
  - rails db:create db:migrate db:seed
  - rails s
  - API disponível no endereço http://localhost:3000/api/v1/veiculos

# Detalhes do Desafio

Desenvolver uma API JSON RESTful em Ruby que utilize todos os métodos (GET, POST, PUT, DELETE).

Especificação:

Monte uma base de veículo com a seguinte estrutura:

    id: PK
    marca: string
    modelo: string
    ano: integer
    descricao: text
    vendido: bool
    created_at: datetime
    updated_at: datetime

API Endpoints:

    GET /veiculos: Retorna todos os veículos
    GET /veiculos/{id}: Retorna os detalhes de um veículo específico
    POST /veiculos: Adiciona um novo veículo
    PUT /veiculos/{id}: Atualiza os dados de um veículo
    DELETE /veiculos/{id}: Apaga o veículo

# Detahes da implementação

    URL: http://localhost:3000/api/v1/veiculos

## Métodos
Requisições para a API devem seguir os padrões:
| Método | Descrição |
|---|---|
| `GET` | Retorna informações de um ou mais veiculos. |
| `POST` | Utilizado para cadastrar um novo veiculo. |
| `PATCH` | Atualiza total ou parcial os dados de cadastro de um veiculo. |
| `DELETE` | Remove o registro de um veiculo. |


## Respostas

| Código | Descrição |
|---|---|
| `200` | Requisição executada com sucesso (success).|
| `203` | Registro criado com sucesso (success).|
| `401` | Dados de acesso inválidos. (Unauthorized)|
| `404` | Registro pesquisado não encontrado (Not found).|
| `422` | Não foi possível processar as instruções presentes. (Unprocessable Entity).|

# Recurso


### Veiculos [/api/v1/veiculos]


### Listar (List) [GET]

+ Request (application/json)

+ Response 200 (application/json) - Retorna todos os veiculos cadastrados

        [
          {
            "id": 1
            "marca": "Toyota",
            "modelo": "Etios",
            "ano": 2018,
            "descrição": "Prata, 4 portas, manual",
            "vendido": true
          }
        ]


### Novo (Create) [POST]

+ **Usuário deve enviar suas credencias para realizar essa ação**.

+ Attributes (object)

    + **marca**: Fabricante do veiculo (string, **required**)
    + **modelo**: Modelo do veiculo (string, **required**)
    + **ano**: Ano de fabricação do veiculo (integer, **required**)
    + descrição: Uma descrição para este veiculo (string, optional)
    + vendido: **true** para veiculo vendido ou **false** para disponível (boolean, optional)

+ Request (application/json)

    + Headers (Utilize as credencias abaixo)

            X-User-Email: user@user.com
            X-User-Token: f5o-xRK7fRcSiN4HpMJs

    + Body

          {
            "marca": "Toyota",
            "modelo": "Corolla",
            "ano": 2020,
            "descrição": "Branco, 4 portas, automático",
            "vendido": false
          }

+ Response 203 (application/json) - Todos os dados do veiculo cadastrado.

    + Body

            {
              "id": 2
              "marca": "Toyota",
              "modelo": "Corolla",
              "ano": 2020,
              "descrição": "Branco, 4 portas, automático",
              "vendido": false
            }

+ Response 401 (application/json) - Credencias não foram informadas.

    + Body

          [
            {
              "error": "You need to sign in or sign up before continuing."
            }
          ]


### Detalhar (Read) [GET /veiculos/{codigo}]

+ Parameters
    + codigo (required, number, `2`) ... Código do veiculo

+ Request (application/json)

+ Response 200 (application/json) - Todos os dados do veiculo solicitado.

    + Body

          {
            "id": 2
            "marca": "Toyota",
            "modelo": "Corolla",
            "ano": 2020,
            "descrição": "Branco, 4 portas, automático",
            "vendido": false
          }

+ Response 404 (application/json) - Veiculo não encontrado.

    + Body

            {
              "status": 404,
              "error": "Not Found",
              "exception": "Couldn't find veiculo with 'id'=2>"
            }


### Editar (Update) [PATCH /veiculos/{codigo}]

+ **Usuário deve enviar suas credencias para realizar essa ação**.

+ Parameters
    + codigo (required, number, `1`) ... Código do veiculo

+ Request (application/json)

    + Headers (Utilize as credencias abaixo)

                X-User-Email: user@user.com
                X-User-Token: f5o-xRK7fRcSiN4HpMJs

    + Body
    
              {
                "veiculo": "Etios Sedan",
              }

+ Response 200 (application/json) - Todos os dados do veiculo alterado.

    + Body

              {
                "id": 1
                "marca": "Toyota",
                "modelo": "Etios Sedan",
                "ano": 2018,
                "descrição": "Prata, 4 portas, manual",
                "vendido": true
              }

+ Response 404 (application/json) - Veiculo não encontrado.

    + Body

            {
              "status": 404,
              "error": "Not Found",
              "exception": "Couldn't find veiculo with 'id'=1>"
            }

+ Response 401 (application/json) - Credencias não foram informadas.

    + Body

          [
            {
              "error": "You need to sign in or sign up before continuing."
            }
          ]


### Remover (Delete) [DELETE /veiculos/{codigo}]

+ **Usuário deven enviar suas credencias para realizar essa ação**.

+ Request (application/json)

+ Parameters
    + codigo (required, number, `2`) ... Código do veiculo

+ Request (application/json)

    + Headers (Utilize as credencias abaixo)

                X-User-Email: user@user.com
                X-User-Token: f5o-xRK7fRcSiN4HpMJs

+ Response 200 (application/json) - Excluido com sucesso o retorno é um objeto vazio.

    + Body

            {}

+ Response 404 (application/json) - Veiculo não encontrado.

    + Body

            {
              "status": 404,
              "error": "Not Found",
              "exception": "Couldn't find veiculo with 'id'=1>"
            }

+ Response 401 (application/json) - Credencias não foram informadas.

    + Body

          [
            {
              "error": "You need to sign in or sign up before continuing."
            }
          ]
