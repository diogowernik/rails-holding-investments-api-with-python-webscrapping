class PortfolioStocksController < ApplicationController
  before_action :set_portfolio_stock, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_stocks
  # GET /portfolio_stocks.json
  def index
    @portfolio_stocks = PortfolioStock.all
  end

  # GET /portfolio_stocks/1
  # GET /portfolio_stocks/1.json
  def show
  end

  # GET /portfolio_stocks/new
  def new
    @portfolio_stock = PortfolioStock.new
  end

  # GET /portfolio_stocks/1/edit
  def edit
  end

  # POST /portfolio_stocks
  # POST /portfolio_stocks.json
  def create
    @portfolio_stock = PortfolioStock.new(portfolio_stock_params)

    respond_to do |format|
      if @portfolio_stock.save
        format.html { redirect_to @portfolio_stock, notice: 'Portfolio stock was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_stock }
      else
        format.html { render :new }
        format.json { render json: @portfolio_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_stocks/1
  # PATCH/PUT /portfolio_stocks/1.json
  def update
    respond_to do |format|
      if @portfolio_stock.update(portfolio_stock_params)
        format.html { redirect_to @portfolio_stock, notice: 'Portfolio stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_stock }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_stocks/1
  # DELETE /portfolio_stocks/1.json
  def destroy
    @portfolio_stock.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_stocks_url, notice: 'Portfolio stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_stock
      @portfolio_stock = PortfolioStock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_stock_params
      params.require(:portfolio_stock).permit(:category_id, :portfolio_id, :stock_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
