class PortfolioBrStocksController < ApplicationController
  before_action :set_portfolio_br_stock, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_br_stocks
  # GET /portfolio_br_stocks.json
  def index
    @portfolio_br_stocks = PortfolioBrStock.all
  end

  # GET /portfolio_br_stocks/1
  # GET /portfolio_br_stocks/1.json
  def show
  end

  # GET /portfolio_br_stocks/new
  def new
    @portfolio_br_stock = PortfolioBrStock.new
  end

  # GET /portfolio_br_stocks/1/edit
  def edit
  end

  # POST /portfolio_br_stocks
  # POST /portfolio_br_stocks.json
  def create
    @portfolio_br_stock = PortfolioBrStock.new(portfolio_br_stock_params)

    respond_to do |format|
      if @portfolio_br_stock.save
        format.html { redirect_to portfolio_path(@portfolio_br_stock.portfolio.id), notice: 'Portfolio br stock was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_br_stock }
      else
        format.html { render :new }
        format.json { render json: @portfolio_br_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_br_stocks/1
  # PATCH/PUT /portfolio_br_stocks/1.json
  def update
    respond_to do |format|
      if @portfolio_br_stock.update(portfolio_br_stock_params)
        format.html { redirect_to portfolio_path(@portfolio_br_stock.portfolio.id), notice: 'Portfolio br stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_br_stock }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_br_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_br_stocks/1
  # DELETE /portfolio_br_stocks/1.json
  def destroy
    @portfolio_br_stock.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_path(@portfolio_br_stock.portfolio.id), notice: 'Portfolio br stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_br_stock
      @portfolio_br_stock = PortfolioBrStock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_br_stock_params
      params.require(:portfolio_br_stock).permit(:category_id, :portfolio_id, :br_stock_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
