class PortfolioHoldingTokensController < ApplicationController
  before_action :set_portfolio_holding_token, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_holding_tokens
  # GET /portfolio_holding_tokens.json
  def index
    @portfolio_holding_tokens = PortfolioHoldingToken.all
  end

  # GET /portfolio_holding_tokens/1
  # GET /portfolio_holding_tokens/1.json
  def show
  end

  # GET /portfolio_holding_tokens/new
  def new
    @portfolio_holding_token = PortfolioHoldingToken.new
  end

  # GET /portfolio_holding_tokens/1/edit
  def edit
  end

  # POST /portfolio_holding_tokens
  # POST /portfolio_holding_tokens.json
  def create
    @portfolio_holding_token = PortfolioHoldingToken.new(portfolio_holding_token_params)

    respond_to do |format|
      if @portfolio_holding_token.save
        format.html { redirect_to @portfolio_holding_token, notice: 'Portfolio holding token was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_holding_token }
      else
        format.html { render :new }
        format.json { render json: @portfolio_holding_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_holding_tokens/1
  # PATCH/PUT /portfolio_holding_tokens/1.json
  def update
    respond_to do |format|
      if @portfolio_holding_token.update(portfolio_holding_token_params)
        format.html { redirect_to @portfolio_holding_token, notice: 'Portfolio holding token was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_holding_token }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_holding_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_holding_tokens/1
  # DELETE /portfolio_holding_tokens/1.json
  def destroy
    @portfolio_holding_token.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_holding_tokens_url, notice: 'Portfolio holding token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_holding_token
      @portfolio_holding_token = PortfolioHoldingToken.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_holding_token_params
      params.require(:portfolio_holding_token).permit(:category_id, :portfolio_id, :holding_token_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
