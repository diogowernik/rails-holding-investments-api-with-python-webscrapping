class Api::PortfoliofiisController < ApplicationController
  before_action :set_portfoliofii, only: %i[ show update destroy ]

  # GET /portfoliofiis
  # GET /portfoliofiis.json
  def index
    @portfoliofiis = Portfoliofii.all.order("id desc")
    render 'api/portfoliofiis/index.json.jbuilder'

    # render json: @portfoliofiis.to_json(
    #       :only => [:amount,:cost, :total, :total_cost, :id],
    #       :include =>[
    #         {:category => { :only => [:title, :id] }}, 
    #         {:portfolio => { :only => [:title, :id] }},
    #         {:fii => { :only => [:title, :ticker, :price, :id] }}
    #       ] )
  end

  # GET /portfoliofiis/1
  # GET /portfoliofiis/1.json
  def show
    render 'api/portfoliofiis/show.json.jbuilder'
  end

  # POST /portfoliofiis
  # POST /portfoliofiis.json
  def create
    @portfoliofii = Portfoliofii.new(portfoliofii_params)

    if @portfoliofii.save
      render json: @portfoliofii, status: :created
    else
      render json: @portfoliofii.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /portfoliofiis/1
  # PATCH/PUT /portfoliofiis/1.json
  def update
    if @portfoliofii.update(portfoliofii_params)
      render :show, status: :ok, location: @portfoliofii
    else
      render json: @portfoliofii.errors, status: :unprocessable_entity
    end
  end

  # DELETE /portfoliofiis/1
  # DELETE /portfoliofiis/1.json
  def destroy
    @portfoliofii.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfoliofii
      @portfoliofii = Portfoliofii.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfoliofii_params
      params.require(:portfoliofii).permit(:category_id, :portfolio_id, :fii_id, :amount, :cost, :total_cost, :total_today)
    end
end
