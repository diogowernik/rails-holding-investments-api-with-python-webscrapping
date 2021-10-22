class CriptoDividendsController < ApplicationController
  before_action :set_cripto_dividend, only: [:show, :edit, :update, :destroy]

  # GET /cripto_dividends
  # GET /cripto_dividends.json
  def index
    @cripto_dividends = CriptoDividend.all
  end

  # GET /cripto_dividends/1
  # GET /cripto_dividends/1.json
  def show
  end

  # GET /cripto_dividends/new
  def new
    @cripto_dividend = CriptoDividend.new
  end

  # GET /cripto_dividends/1/edit
  def edit
  end

  # POST /cripto_dividends
  # POST /cripto_dividends.json
  def create
    @cripto_dividend = CriptoDividend.new(cripto_dividend_params)

    respond_to do |format|
      if @cripto_dividend.save
        format.html { redirect_to portfolio_criptos_management_path(@cripto_dividend.portfolio.id), notice: 'Cripto dividend was successfully created.' }
        format.json { render :show, status: :created, location: @cripto_dividend }
      else
        format.html { render :new }
        format.json { render json: @cripto_dividend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cripto_dividends/1
  # PATCH/PUT /cripto_dividends/1.json
  def update
    respond_to do |format|
      if @cripto_dividend.update(cripto_dividend_params)
        format.html { redirect_to portfolio_criptos_management_path(@cripto_dividend.portfolio.id), notice: 'Cripto dividend was successfully updated.' }
        format.json { render :show, status: :ok, location: @cripto_dividend }
      else
        format.html { render :edit }
        format.json { render json: @cripto_dividend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cripto_dividends/1
  # DELETE /cripto_dividends/1.json
  def destroy
    @cripto_dividend.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_criptos_management_path(@cripto_dividend.portfolio.id), notice: 'Cripto dividend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cripto_dividend
      @cripto_dividend = CriptoDividend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cripto_dividend_params
      params.require(:cripto_dividend).permit(:category_id, :portfolio_cripto_id, :cripto_id, :month_id, :year_id, :portfolio_id, :brl_total, :usd_total, :record_date, :pay_date, :value_per_share, :total, :yield_on_cost)
    end
end
