class PortfolioCurrenciesController < ApplicationController
  before_action :set_portfolio_currency, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_currencies
  # GET /portfolio_currencies.json
  def index
    @portfolio_currencies = PortfolioCurrency.all
  end

  # GET /portfolio_currencies/1
  # GET /portfolio_currencies/1.json
  def show
  end

  # GET /portfolio_currencies/new
  def new
    @portfolio_currency = PortfolioCurrency.new
  end

  # GET /portfolio_currencies/1/edit
  def edit
  end

  # POST /portfolio_currencies
  # POST /portfolio_currencies.json
  def create
    @portfolio_currency = PortfolioCurrency.new(portfolio_currency_params)

    respond_to do |format|
      if @portfolio_currency.save
        format.html { redirect_to @portfolio_currency, notice: 'Portfolio currency was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_currency }
      else
        format.html { render :new }
        format.json { render json: @portfolio_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_currencies/1
  # PATCH/PUT /portfolio_currencies/1.json
  def update
    respond_to do |format|
      if @portfolio_currency.update(portfolio_currency_params)
        format.html { redirect_to @portfolio_currency, notice: 'Portfolio currency was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_currency }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_currencies/1
  # DELETE /portfolio_currencies/1.json
  def destroy
    @portfolio_currency.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_currencies_url, notice: 'Portfolio currency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_currency
      @portfolio_currency = PortfolioCurrency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_currency_params
      params.require(:portfolio_currency).permit(:category_id, :portfolio_id, :currency_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
