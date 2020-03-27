# Desafio: Nobordist

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Detalhes do Desafio

Desenvolver uma API JSON RESTful em Ruby que utilize todos os métodos (GET, POST, PUT, DELETE).

Especificação:

Monte uma base de veículo com a seguinte estrutura:

    id: PK
    marca: string
    veiculo: string
    ano: integer
    descricao: text
    vendido: bool
    created_at: datetime
    updated_at: datetime

API Endpoints:

    GET/veiculos: Retorna todos os veículos
    GET/veiculos/{id}: Retorna os detalhes de um veículo específico
    POST/veiculos: Adiciona um novo veículo
    PUT/veiculos/{id}: Atualiza os dados de um veículo
    DELETE/veiculos/{id}: Apaga o veículo

# Implementação

    host: localhost:3000
    basePath: /api/v1
    schemes: http

## Métodos
Requisições para a API devem seguir os padrões:
| Método | Descrição |
|---|---|
| `GET` | Retorna informações de um ou mais veiculos. |
| `POST` | Utilizado para criar um novo veiculo. |
| `PATCH` | Atualiza total ou parcial os dados de um veiculo. |
| `DELETE` | Remove o registro de um veiculo. |


## Respostas

| Código | Descrição |
|---|---|
| `200` | Requisição executada com sucesso (success).|
| `203` | Registro criado com sucesso (success).|
| `401` | Dados de acesso inválidos. (Unauthorized)|
| `404` | Registro pesquisado não encontrado (Not found).|


# Recurso


### Veiculos [/api/v1/veiculos]


### Listar (List) [GET]

+ Request (application/json)

+ Response 200 (application/json) - Retorna todos os veiculos cadastrados

        [
          {
            "id": 1
            "marca": "Toyota",
            "veiculo": "Etios",
            "ano": 2018,
            "descrição": "Prata, 4 portas, manual",
            "vendido": true
          }
        ]


### Novo (Create) [POST]

+ Usuário deve enviar suas credencias para realizar tal ação.

+ Attributes (object)

    + marca: Fabricante do veiculo (string, required)
    + veiculo: Modelo do veiculo (string, required)
    + ano: Ano de fabricação do veiculo (integer, required)
    + descrição: Uma descrição para este veiculo (string, optional)
    + vendido: true para veiculo vendido false caso contrário (boolean, optional)

+ Request (application/json)

    + Headers

            X-User-Email: user@user.com
            X-User-Token: f5o-xRK7fRcSiN4HpMJs

    + Body


          {
            "marca": "Toyota",
            "veiculo": "Corolla",
            "ano": 2020,
            "descrição": "Branco, 4 portas, automático",
            "vendido": false
          }

+ Response 203 (application/json) - Todos os dados do veiculo criado

    + Body

          [
            {
              "id": 2
              "marca": "Toyota",
              "veiculo": "Corolla",
              "ano": 2020,
              "descrição": "Branco, 4 portas, automático",
              "vendido": false
            }
          ]

+ Response 401 (application/json) - Não tem autorização ou credencias não foram enviadas.

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
            "veiculo": "Corolla",
            "ano": 2020,
            "descrição": "Branco, 4 portas, automático",
            "vendido": false
          }

+ Response 404 (application/json) - Veiculo não for encontrado.

    + Body

            {
              "status": 404,
              "error": "Not Found",
              "exception": "#<ActiveRecord::RecordNotFound: Couldn't find veiculo with 'id'=2>"
            }


### Editar (Update) [PATCH  /veiculos/{codigo}]

+ Usuário deve enviar suas credencias para realizar tal ação.

+ Parameters
    + codigo (required, number, `1`) ... Código do veiculo

+ Request (application/json)

    + Headers

                X-User-Email: user@user.com
                X-User-Token: f5o-xRK7fRcSiN4HpMJs

    + Body

            [
              {
                "veiculo": "Etios Sedan",
              }
            ]


+ Response 200 (application/json) - Todos os dados do veiculo alterado.

    + Body

            [
              {
                "id": 1
                "marca": "Toyota",
                "veiculo": "Etios Sedan",
                "ano": 2018,
                "descrição": "Prata, 4 portas, manual",
                "vendido": true
              }
            ]

+ Response 404 (application/json) - Veiculo não encontrado.

    + Body

            {
              "status": 404,
              "error": "Not Found",
              "exception": "#<ActiveRecord::RecordNotFound: Couldn't find veiculo with 'id'=1>"
            }

+ Response 401 (application/json) - Não tem autorização ou credencias não foram enviadas.

    + Body

          [
            {
              "error": "You need to sign in or sign up before continuing."
            }
          ]


### Remover (Delete) [DELETE  /veiculos/{codigo}]

+ Usuário deven enviar suas credencias para realizar tal ação.

+ Request (application/json)

+ Parameters
    + codigo (required, number, `2`) ... Código do veiculo

+ Request (application/json)

    + Headers

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
              "exception": "#<ActiveRecord::RecordNotFound: Couldn't find veiculo with 'id'=1>"
            }

+ Response 401 (application/json) - Não tem autorização ou credencias não foram enviadas.

    + Body

          [
            {
              "error": "You need to sign in or sign up before continuing."
            }
          ]