class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy, :br_stocks_management, :fiis_management, :subscriptions_management, :properties_management, :fixed_incomes_management , :criptos_management, :internationals_management, :calls_management, :puts_management]
  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = Portfolio.all
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    @portfolios = Portfolio.all
    @portfolio_criptos = PortfolioCripto.all.where(:portfolio_id => @portfolio.id)
    @portfolio_fiis = PortfolioFii.all.where(:portfolio_id => @portfolio.id)
    @portfolio_br_stocks = PortfolioBrStock.all.where(:portfolio_id => @portfolio.id)
    @portfolio_properties = PortfolioProperty.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def composition
    @portfolios = Portfolio.all
    render layout: "app" 
  end

  def calls_management
    @portfolios = Portfolio.all
    @portfolio_open_calls = PortfolioCall.all.where(:portfolio_id => @portfolio.id).where(:situation_id => 1)
    @portfolio_calls = PortfolioCall.all.where(:portfolio_id => @portfolio.id).where("situation_id = 2 or situation_id = 3 or situation_id = 4")
    @portfolio_br_stocks = PortfolioBrStock.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def puts_management
    @portfolios = Portfolio.all
    @portfolio_open_puts = PortfolioPut.all.where(:portfolio_id => @portfolio.id).where(:situation_id => 1)
    @portfolio_puts = PortfolioPut.all.where(:portfolio_id => @portfolio.id).where("situation_id = 2 or situation_id = 3 or situation_id = 4")
    @portfolio_br_stocks = PortfolioBrStock.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def br_stocks_management
    @portfolios = Portfolio.all
    @portfolio_br_stocks = PortfolioBrStock.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def fiis_management
    @portfolios = Portfolio.all
    @portfolio_fiis = PortfolioFii.all.where(:portfolio_id => @portfolio.id)
    @fiis = Fii.all
    render layout: "app" 
  end

  def criptos_management
    @portfolios = Portfolio.all
    @portfolio_criptos = PortfolioCripto.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def subscriptions_management
    @portfolios = Portfolio.all
    @portfolio_subscriptions = PortfolioSubscription.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def fixed_incomes_management
    @portfolios = Portfolio.all
    @portfolio_fixed_incomes = PortfolioFixedIncome.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def properties_management
    @portfolios = Portfolio.all
    @portfolio_properties = PortfolioProperty.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def internationals_management
    @portfolios = Portfolio.all
    @portfolio_internationals = PortfolioInternational.all.where(:portfolio_id => @portfolio.id)
    render layout: "app" 
  end

  def radar
    @portfolios = Portfolio.all
    @criptos = Cripto.all
    @fiis = Fii.all
    @br_stocks = BrStock.all
    render layout: "app" 
  end
  

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :slug, :user_id)
    end
end
