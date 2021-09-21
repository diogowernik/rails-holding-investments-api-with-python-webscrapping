class PortfolioGoodsController < ApplicationController
  before_action :set_portfolio_good, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_goods
  # GET /portfolio_goods.json
  def index
    @portfolio_goods = PortfolioGood.all
  end

  # GET /portfolio_goods/1
  # GET /portfolio_goods/1.json
  def show
  end

  # GET /portfolio_goods/new
  def new
    @portfolio_good = PortfolioGood.new
    @portfolio_id = params[:portfolio_id]
  end

  # GET /portfolio_goods/1/edit
  def edit
  end

  # POST /portfolio_goods
  # POST /portfolio_goods.json
  def create
    @portfolio_good = PortfolioGood.new(portfolio_good_params)
    @portfolio_id = params[:portfolio_id]

    respond_to do |format|
      if @portfolio_good.save
        format.html { redirect_to portfolio_goods_management_path(@portfolio_good.portfolio.id), notice: 'Portfolio good was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_good }
      else
        format.html { render :new }
        format.json { render json: @portfolio_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_goods/1
  # PATCH/PUT /portfolio_goods/1.json
  def update
    respond_to do |format|
      if @portfolio_good.update(portfolio_good_params)
        format.html { redirect_to portfolio_goods_management_path(@portfolio_good.portfolio.id), notice: 'Portfolio good was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_good }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_goods/1
  # DELETE /portfolio_goods/1.json
  def destroy
    @portfolio_good.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_goods_management_path(@portfolio_good.portfolio.id), notice: 'Portfolio good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_good
      @portfolio_good = PortfolioGood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_good_params
      params.require(:portfolio_good).permit(:category_id, :portfolio_id, :good_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
