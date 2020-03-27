# Todos os controllers nessa versão da API devem herdar de ApiController 
module Api::V1
  class ApiController < ApplicationController
    # Verifica se o token e o email da requisição pertencem a um usuário válido.
    acts_as_token_authentication_handler_for User
    # A autenticação será requerida para todos os métodos exceto GET
    skip_before_action :authenticate_user!, only: [ :index, :show ]
  end

  private
  
  # Método criado para validar a autenticação
  def require_authentication!
    throw(:warden, scope: :user) unless current_user.presence
  end  

end