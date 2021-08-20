class Api::CriptosController < ApplicationController
  before_action :set_cripto, only: [:show, :update, :destroy]

  # GET /criptos
  def index
    @criptos = Cripto.all

    render json: @criptos.order("id desc")
  end

  def options
    @criptos = Cripto.all
    render 'api/criptos/options.json.jbuilder'
  end

  # GET /criptos/1
  def show
    render json: @cripto
  end

  # POST /criptos
  def create
    @cripto = Cripto.new(cripto_params)

    if @cripto.save
      render json: @cripto, status: :created
    else
      render json: @cripto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /criptos/1
  def update
    if @cripto.update(cripto_params)
      render json: @cripto
    else
      render json: @cripto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /criptos/1
  def destroy
    @cripto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cripto
      @cripto = Cripto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cripto_params
      params.require(:cripto).permit(:ticker, :title, :slug, :price, :coingecko_id)
    end
end
