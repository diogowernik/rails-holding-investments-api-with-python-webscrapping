class Api::PortfoliocriptosController < ApplicationController
  before_action :set_portfoliocripto, only: %i[ show update destroy ]

  # GET /portfoliocriptos
  # GET /portfoliocriptos.json
  def index
    @portfoliocriptos = Portfoliocripto.all.order("id desc")
    render 'api/portfoliocriptos/index.json.jbuilder'
  end

  # GET /portfoliocriptos/1
  # GET /portfoliocriptos/1.json
  def show
    render 'api/portfoliocriptos/show.json.jbuilder'
  end

  # POST /portfoliocriptos
  # POST /portfoliocriptos.json
  def create
    @portfoliocripto = Portfoliocripto.new(portfoliocripto_params)

    if @portfoliocripto.save
      render json: @portfoliocripto, status: :created
    else
      render json: @portfoliocripto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /portfoliocriptos/1
  # PATCH/PUT /portfoliocriptos/1.json
  def update
    if @portfoliocripto.update(portfoliocripto_params)
      render json: @portfoliocripto
    else
      render json: @portfoliocripto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /portfoliocriptos/1
  # DELETE /portfoliocriptos/1.json
  def destroy
    @portfoliocripto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfoliocripto
      @portfoliocripto = Portfoliocripto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfoliocripto_params
      params.require(:portfoliocripto).permit(:category_id, :portfolio_id, :cripto_id, :amount, :cost, :total_cost, :total_today)
    end
end
