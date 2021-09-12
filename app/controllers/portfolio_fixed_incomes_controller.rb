class PortfolioFixedIncomesController < ApplicationController
  before_action :set_portfolio_fixed_income, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_fixed_incomes
  # GET /portfolio_fixed_incomes.json
  def index
    @portfolio_fixed_incomes = PortfolioFixedIncome.all
  end

  # GET /portfolio_fixed_incomes/1
  # GET /portfolio_fixed_incomes/1.json
  def show
  end

  # GET /portfolio_fixed_incomes/new
  def new
    @portfolio_fixed_income = PortfolioFixedIncome.new
  end

  # GET /portfolio_fixed_incomes/1/edit
  def edit
  end

  # POST /portfolio_fixed_incomes
  # POST /portfolio_fixed_incomes.json
  def create
    @portfolio_fixed_income = PortfolioFixedIncome.new(portfolio_fixed_income_params)

    respond_to do |format|
      if @portfolio_fixed_income.save
        format.html { redirect_to portfolio_fixed_incomes_management_path(@portfolio_fixed_income.portfolio.id), notice: 'Portfolio fixed income was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_fixed_income }
      else
        format.html { render :new }
        format.json { render json: @portfolio_fixed_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_fixed_incomes/1
  # PATCH/PUT /portfolio_fixed_incomes/1.json
  def update
    respond_to do |format|
      if @portfolio_fixed_income.update(portfolio_fixed_income_params)
        format.html { redirect_to portfolio_fixed_incomes_management_path(@portfolio_fixed_income.portfolio.id), notice: 'Portfolio fixed income was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_fixed_income }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_fixed_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_fixed_incomes/1
  # DELETE /portfolio_fixed_incomes/1.json
  def destroy
    @portfolio_fixed_income.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_fixed_incomes_management_path(@portfolio_fixed_income.portfolio.id), notice: 'Portfolio fixed income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_fixed_income
      @portfolio_fixed_income = PortfolioFixedIncome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_fixed_income_params
      params.require(:portfolio_fixed_income).permit(:category_id, :portfolio_id, :fixed_income_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
