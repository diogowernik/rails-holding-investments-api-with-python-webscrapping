class PortfolioCriptosController < ApplicationController
  before_action :set_portfolio_cripto, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_criptos
  # GET /portfolio_criptos.json
  def index
    @portfolio_criptos = PortfolioCripto.all
  end

  # GET /portfolio_criptos/1
  # GET /portfolio_criptos/1.json
  def show
    
  end

  # GET /portfolio_criptos/new
  def new
    @portfolio_cripto = PortfolioCripto.new
  end

  # GET /portfolio_criptos/1/edit
  def edit
  end

  # POST /portfolio_criptos
  # POST /portfolio_criptos.json
  def create
    @portfolio_cripto = PortfolioCripto.new(portfolio_cripto_params)

    respond_to do |format|
      if @portfolio_cripto.save
        format.html { redirect_to portfolio_criptos_management_path(@portfolio_cripto.portfolio.id), notice: 'Portfolio cripto was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_cripto }
      else
        format.html { render :new }
        format.json { render json: @portfolio_cripto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_criptos/1
  # PATCH/PUT /portfolio_criptos/1.json
  def update
    respond_to do |format|
      if @portfolio_cripto.update(portfolio_cripto_params)
        format.html { redirect_to portfolio_criptos_management_path(@portfolio_cripto.portfolio.id), notice: 'Portfolio cripto was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_cripto }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_cripto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_criptos/1
  # DELETE /portfolio_criptos/1.json
  def destroy
    @portfolio_cripto.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_criptos_management_path(@portfolio_cripto.portfolio.id), notice: 'Portfolio cripto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_cripto
      @portfolio_cripto = PortfolioCripto.find(params[:id])
    end

    def set_portfolio
      @portfolio = Portfolio.find(params[@portfolio_cripto.portfolio.id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_cripto_params
      params.require(:portfolio_cripto).permit(:category_id, :portfolio_id, :cripto_id, :shares_amount, :share_cost, :total_cost, :dividends_profit, :trade_profit, :total_today)
    end
end

