class Admin::BrStocksController < AdminController
  before_action :set_br_stock, only: [:show, :edit, :update, :destroy]

  # GET /br_stocks
  # GET /br_stocks.json
  def index
    @br_stocks = BrStock.all
  end

  # GET /br_stocks/1
  # GET /br_stocks/1.json
  def show
  end

  # GET /br_stocks/new
  def new
    @br_stock = BrStock.new
  end

  # GET /br_stocks/1/edit
  def edit
  end

  # POST /br_stocks
  # POST /br_stocks.json
  def create
    @br_stock = BrStock.new(br_stock_params)

    respond_to do |format|
      if @br_stock.save
        format.html { redirect_to admin_br_stocks_url, notice: 'Br stock was successfully created.' }
        format.json { render :show, status: :created, location: @br_stock }
      else
        format.html { render :new }
        format.json { render json: @br_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /br_stocks/1
  # PATCH/PUT /br_stocks/1.json
  def update
    respond_to do |format|
      if @br_stock.update(br_stock_params)
        format.html { redirect_to admin_br_stocks_url, notice: 'Br stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @br_stock }
      else
        format.html { render :edit }
        format.json { render json: @br_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /br_stocks/1
  # DELETE /br_stocks/1.json
  def destroy
    @br_stock.destroy
    respond_to do |format|
      format.html { redirect_to admin_br_stocks_url, notice: 'Br stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_br_stock
      @br_stock = BrStock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def br_stock_params
      params.require(:br_stock).permit(:ticker, :title, :slug, :price)
    end
end
