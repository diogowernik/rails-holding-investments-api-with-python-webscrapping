class Api::PortfoliosController < ApiController
  before_action :set_portfolio, only: [:show, :update, :destroy, :fiis_chart, :fixed_incomes_chart, :goods_chart, :properties_chart, :criptos_chart, :br_stocks_chart, :internationals_chart, :portfoliofiis, :portfoliocriptos]

  # GET /portfolios
  def index
    @portfolios = current_user.portfolios
    render json: @portfolios.order("id desc")
  end

  # GET /portfolios/1
  def show
    @categories = Category.all.order("custom_order asc")
    @portfolio_fiis = PortfolioFii.all.where(:portfolio_id => @portfolio.id).order("id desc")
    @portfolio_goods = PortfolioGood.all.where(:portfolio_id => @portfolio.id).order("id desc")
    @portfolio_subscriptions = PortfolioSubscription.all.where(:portfolio_id => @portfolio.id).order("id desc")
    @portfolio_criptos = PortfolioCripto.all.where(:portfolio_id => @portfolio.id).order("id desc")
    @portfolio_br_stocks = PortfolioBrStock.all.where(:portfolio_id => @portfolio.id).order("id desc")
    @portfolio_properties = PortfolioProperty.all.where(:portfolio_id => @portfolio.id).order("id desc")
    @portfolio_internationals = PortfolioInternational.all.where(:portfolio_id => @portfolio.id).order("total_today asc")
    @portfolio_fixed_incomes = PortfolioFixedIncome.all.where(:portfolio_id => @portfolio.id).order("id desc")
    render 'api/portfolios/show.json.jbuilder'
  end

  def br_stocks_chart
    @categories = Category.all
    @portfolio_br_stocks = PortfolioBrStock.all.where(:portfolio_id => @portfolio.id).order("total_today asc")
    render 'api/portfolios/br_stocks_chart.json.jbuilder'
  end

  def criptos_chart
    @categories = Category.all
    @portfolio_criptos = PortfolioCripto.all.where(:portfolio_id => @portfolio.id).order("total_today asc")
    render 'api/portfolios/criptos_chart.json.jbuilder'
  end

  def goods_chart
    @categories = Category.all
    @portfolio_goods = PortfolioGood.all.where(:portfolio_id => @portfolio.id).order("total_today asc")
    render 'api/portfolios/goods_chart.json.jbuilder'
  end

  def fiis_chart
    @categories = Category.all
    @portfolio_fiis = PortfolioFii.all.where(:portfolio_id => @portfolio.id).order("total_today asc")
    render 'api/portfolios/fiis_chart.json.jbuilder'
  end

  def internationals_chart
    @categories = Category.all
    @portfolio_internationals = PortfolioInternational.all.where(:portfolio_id => @portfolio.id).order("total_today asc")
    render 'api/portfolios/internationals_chart.json.jbuilder'
  end

  def properties_chart
    @categories = Category.all
    @portfolio_properties = PortfolioProperty.all.where(:portfolio_id => @portfolio.id).order("total_today asc")
    render 'api/portfolios/properties_chart.json.jbuilder'
  end

  def fixed_incomes_chart
    @categories = Category.all
    @portfolio_fixed_incomes = PortfolioFixedIncome.all.where(:portfolio_id => @portfolio.id).order("total_today asc")
    render 'api/portfolios/fixed_incomes_chart.json.jbuilder'
  end


  # POST /portfolios
  def create
    if portfolio = current_user.portfolios.create(portfolio_params)
      if @portfolio.save
        render json: @portfolio, status: :created
      else
        render json: @portfolio.errors, status: :unprocessable_entity
      end
    else 
      render json: portfolio.errors, status: 400
    end
    
  end

  # PATCH/PUT /portfolios/1
  def update
    if @portfolio.update(portfolio_params)
      render json: @portfolio
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /portfolios/1
  def destroy
    @portfolio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :slug)
    end
end
