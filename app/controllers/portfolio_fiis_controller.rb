class PortfolioFiisController < ApplicationController
  before_action :set_portfolio_fii, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_fiis
  # GET /portfolio_fiis.json
  def index
    @portfolio_fiis = PortfolioFii.all
  end

  # GET /portfolio_fiis/1
  # GET /portfolio_fiis/1.json
  def show
    
  end

  # GET /portfolio_fiis/new
  def new
    @portfolio_fii = PortfolioFii.new
  end

  # GET /portfolio_fiis/1/edit
  def edit
  end

  # POST /portfolio_fiis
  # POST /portfolio_fiis.json
  def create
    @portfolio_fii = PortfolioFii.new(portfolio_fii_params)

    respond_to do |format|
      if @portfolio_fii.save
        format.html { redirect_to portfolio_fiis_management_path(@portfolio_fii.portfolio.id), notice: 'Portfolio fii was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_fii }
      else
        format.html { render :new }
        format.json { render json: @portfolio_fii.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_fiis/1
  # PATCH/PUT /portfolio_fiis/1.json
  def update
    respond_to do |format|
      if @portfolio_fii.update(portfolio_fii_params)
        format.html { redirect_to portfolio_fiis_management_path(@portfolio_fii.portfolio.id), notice: 'Portfolio fii was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_fii }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_fii.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_fiis/1
  # DELETE /portfolio_fiis/1.json
  def destroy
    @portfolio_fii.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_fiis_management_path(@portfolio_fii.portfolio.id), notice: 'Portfolio fii was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_fii
      @portfolio_fii = PortfolioFii.find(params[:id])
    end

    def set_portfolio
      @portfolio = Portfolio.find(params[@portfolio_fii.portfolio.id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_fii_params
      params.require(:portfolio_fii).permit(:category_id, :portfolio_id, :fii_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
