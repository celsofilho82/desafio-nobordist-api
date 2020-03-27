class Api::V1::VeiculosController < Api::V1::ApiController
  before_action :set_veiculo, only: [:show, :update, :destroy]

  # GET /api/v1/veiculos
  def index
    @veiculos = Veiculo.all 

    render json: @veiculos
  end

  # GET /api/v1/veiculos/1
  def show
    render json: @veiculo
  end

  # POST /api/v1/veiculos
  def create
    @veiculo = Veiculo.new(veiculo_params)

    if @veiculo.save
      render json: @veiculo, status: :created
    else
      render json: @veiculo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/veiculos/1
  def update
    if @veiculo.update(veiculo_params)
      render json: @veiculo
    else
      render json: @veiculo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/veiculos/1
  def destroy
    if @veiculo.destroy
      render :nothing => true, status: :no_content
    else
      render json: @veiculo.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def veiculo_params
      params.require(:veiculo).permit(:marca, :veiculo, :ano, :descricao, :vendido)
    end

end