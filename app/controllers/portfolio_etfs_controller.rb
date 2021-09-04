class PortfolioEtfsController < ApplicationController
  before_action :set_portfolio_etf, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_etfs
  # GET /portfolio_etfs.json
  def index
    @portfolio_etfs = PortfolioEtf.all
  end

  # GET /portfolio_etfs/1
  # GET /portfolio_etfs/1.json
  def show
  end

  # GET /portfolio_etfs/new
  def new
    @portfolio_etf = PortfolioEtf.new
  end

  # GET /portfolio_etfs/1/edit
  def edit
  end

  # POST /portfolio_etfs
  # POST /portfolio_etfs.json
  def create
    @portfolio_etf = PortfolioEtf.new(portfolio_etf_params)

    respond_to do |format|
      if @portfolio_etf.save
        format.html { redirect_to portfolio_international_path(@portfolio_etf.portfolio.id), notice: 'Portfolio etf was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_etf }
      else
        format.html { render :new }
        format.json { render json: @portfolio_etf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_etfs/1
  # PATCH/PUT /portfolio_etfs/1.json
  def update
    respond_to do |format|
      if @portfolio_etf.update(portfolio_etf_params)
        format.html { redirect_to portfolio_international_path(@portfolio_etf.portfolio.id), notice: 'Portfolio etf was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_etf }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_etf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_etfs/1
  # DELETE /portfolio_etfs/1.json
  def destroy
    @portfolio_etf.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_international_path(@portfolio_etf.portfolio.id), notice: 'Portfolio etf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_etf
      @portfolio_etf = PortfolioEtf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_etf_params
      params.require(:portfolio_etf).permit(:category_id, :portfolio_id, :etf_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
