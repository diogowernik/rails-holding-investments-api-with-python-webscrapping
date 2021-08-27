class Api::PortfoliosController < ApiController
  before_action :set_portfolio, only: [:show, :update, :destroy, :portfoliofiis, :portfoliocriptos]

  # GET /portfolios
  def index
    @portfolios = current_user.portfolios

    render json: @portfolios.order("id desc")
  end

  def options
    @portfolios = Portfolio.all
    render 'api/portfolios/options.json.jbuilder'
  end

  # GET /portfolios/1
  def show
    @categories = Category.all
    @portfolio_fiis = PortfolioFii.all.where(:portfolio_id => @portfolio.id).order("id desc")
    @portfolio_criptos = PortfolioCripto.all.where(:portfolio_id => @portfolio.id).order("id desc")
    @portfolio_br_stocks = PortfolioBrStock.all.where(:portfolio_id => @portfolio.id)
    render 'api/portfolios/show.json.jbuilder'
  end

  def portfoliofiis
    @portfoliofiis = Portfoliofii.all.where(:portfolio_id => @portfolio.id).order("id desc")

    render 'api/portfolios/portfoliofiis.json.jbuilder'
  end

  def portfoliocriptos
    @portfoliocriptos = Portfoliocripto.all.where(:portfolio_id => @portfolio.id).order("id desc")

    render 'api/portfolios/portfoliocriptos.json.jbuilder'
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
