class PortfolioInternationalsController < ApplicationController
  before_action :set_portfolio_international, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_internationals
  # GET /portfolio_internationals.json
  def index
    @portfolio_internationals = PortfolioInternational.all
  end

  # GET /portfolio_internationals/1
  # GET /portfolio_internationals/1.json
  def show
  end

  # GET /portfolio_internationals/new
  def new
    @portfolio_international = PortfolioInternational.new
  end

  # GET /portfolio_internationals/1/edit
  def edit
  end

  # POST /portfolio_internationals
  # POST /portfolio_internationals.json
  def create
    @portfolio_international = PortfolioInternational.new(portfolio_international_params)

    respond_to do |format|
      if @portfolio_international.save
        format.html { redirect_to portfolio_internationals_management_path(@portfolio_international.portfolio.id), notice: 'Portfolio international was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_international }
      else
        format.html { render :new }
        format.json { render json: @portfolio_international.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_internationals/1
  # PATCH/PUT /portfolio_internationals/1.json
  def update
    respond_to do |format|
      if @portfolio_international.update(portfolio_international_params)
        format.html { redirect_to portfolio_internationals_management_path(@portfolio_international.portfolio.id), notice: 'Portfolio international was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_international }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_international.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_internationals/1
  # DELETE /portfolio_internationals/1.json
  def destroy
    @portfolio_international.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_internationals_management_path(@portfolio_international.portfolio.id), notice: 'Portfolio international was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_international
      @portfolio_international = PortfolioInternational.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_international_params
      params.require(:portfolio_international).permit(:category_id, :portfolio_id, :international_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
