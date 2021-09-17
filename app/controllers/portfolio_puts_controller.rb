class PortfolioPutsController < ApplicationController
  before_action :set_portfolio_put, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_puts
  # GET /portfolio_puts.json
  def index
    @portfolio_puts = PortfolioPut.all
  end

  # GET /portfolio_puts/1
  # GET /portfolio_puts/1.json
  def show
  end

  # GET /portfolio_puts/new
  def new
    @portfolio_put = PortfolioPut.new
  end

  # GET /portfolio_puts/1/edit
  def edit
  end

  # POST /portfolio_puts
  # POST /portfolio_puts.json
  def create
    @portfolio_put = PortfolioPut.new(portfolio_put_params)

    respond_to do |format|
      if @portfolio_put.save
        format.html { redirect_to portfolio_puts_management_path(@portfolio_put.portfolio.id), notice: 'Portfolio put was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_put }
      else
        format.html { render :new }
        format.json { render json: @portfolio_put.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_puts/1
  # PATCH/PUT /portfolio_puts/1.json
  def update
    respond_to do |format|
      if @portfolio_put.update(portfolio_put_params)
        format.html { redirect_to portfolio_puts_management_path(@portfolio_put.portfolio.id), notice: 'Portfolio put was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_put }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_put.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_puts/1
  # DELETE /portfolio_puts/1.json
  def destroy
    @portfolio_put.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_puts_management_path(@portfolio_put.portfolio.id), notice: 'Portfolio put was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_put
      @portfolio_put = PortfolioPut.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_put_params
      params.require(:portfolio_put).permit(:category_id, :portfolio_id, :put_id, :situation_id, :shares_amount, :price, :total_price, :share_cost, :total_cost, :total_today, :total_strike)
    end
end
