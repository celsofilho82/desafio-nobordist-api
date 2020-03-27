# Todos os controllers nessa versão da API devem herdar de ApiController 
module Api::V1
  class ApiController < ApplicationController
    # Verifica se o token e o email da requisição pertencem a um usuário válido.
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  end

end