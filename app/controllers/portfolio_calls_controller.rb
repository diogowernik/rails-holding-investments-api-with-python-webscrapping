class PortfolioCallsController < ApplicationController
  before_action :set_portfolio_call, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_calls
  # GET /portfolio_calls.json
  def index
    @portfolio_calls = PortfolioCall.all
  end

  # GET /portfolio_calls/1
  # GET /portfolio_calls/1.json
  def show
  end

  # GET /portfolio_calls/new
  def new
    @portfolio_call = PortfolioCall.new
  end

  # GET /portfolio_calls/1/edit
  def edit
  end

  # POST /portfolio_calls
  # POST /portfolio_calls.json
  def create
    @portfolio_call = PortfolioCall.new(portfolio_call_params)

    respond_to do |format|
      if @portfolio_call.save
        format.html { redirect_to portfolio_path(@portfolio_call.portfolio.id), notice: 'Portfolio call was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_call }
      else
        format.html { render :new }
        format.json { render json: @portfolio_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_calls/1
  # PATCH/PUT /portfolio_calls/1.json
  def update
    respond_to do |format|
      if @portfolio_call.update(portfolio_call_params)
        format.html { redirect_to portfolio_path(@portfolio_call.portfolio.id), notice: 'Portfolio call was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_call }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_calls/1
  # DELETE /portfolio_calls/1.json
  def destroy
    @portfolio_call.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_path(@portfolio_call.portfolio.id), notice: 'Portfolio call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_call
      @portfolio_call = PortfolioCall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_call_params
      params.require(:portfolio_call).permit(:category_id, :portfolio_id, :call_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
