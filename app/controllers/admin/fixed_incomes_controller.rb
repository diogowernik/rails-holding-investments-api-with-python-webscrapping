class Admin::FixedIncomesController < AdminController
  before_action :set_fixed_income, only: [:show, :edit, :update, :destroy]

  # GET /fixed_incomes
  # GET /fixed_incomes.json
  def index
    @fixed_incomes = FixedIncome.all
  end

  # GET /fixed_incomes/1
  # GET /fixed_incomes/1.json
  def show
  end

  # GET /fixed_incomes/new
  def new
    @fixed_income = FixedIncome.new
  end

  # GET /fixed_incomes/1/edit
  def edit
  end

  # POST /fixed_incomes
  # POST /fixed_incomes.json
  def create
    @fixed_income = FixedIncome.new(fixed_income_params)

    respond_to do |format|
      if @fixed_income.save
        format.html { redirect_to admin_fixed_incomes_url, notice: 'Fixed income was successfully created.' }
        format.json { render :show, status: :created, location: @fixed_income }
      else
        format.html { render :new }
        format.json { render json: @fixed_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixed_incomes/1
  # PATCH/PUT /fixed_incomes/1.json
  def update
    respond_to do |format|
      if @fixed_income.update(fixed_income_params)
        format.html { redirect_to admin_fixed_incomes_url, notice: 'Fixed income was successfully updated.' }
        format.json { render :show, status: :ok, location: @fixed_income }
      else
        format.html { render :edit }
        format.json { render json: @fixed_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixed_incomes/1
  # DELETE /fixed_incomes/1.json
  def destroy
    @fixed_income.destroy
    respond_to do |format|
      format.html { redirect_to admin_fixed_incomes_url, notice: 'Fixed income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixed_income
      @fixed_income = FixedIncome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fixed_income_params
      params.require(:fixed_income).permit(:ticker, :title, :slug, :price)
    end
end
