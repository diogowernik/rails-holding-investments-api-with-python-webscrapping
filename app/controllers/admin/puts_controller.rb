class Admin::PutsController < AdminController
  before_action :set_put, only: [:show, :edit, :update, :destroy]

  # GET /puts
  # GET /puts.json
  def index
    @puts = Put.all
  end

  # GET /puts/1
  # GET /puts/1.json
  def show
  end

  # GET /puts/new
  def new
    @put = Put.new
  end

  # GET /puts/1/edit
  def edit
  end

  # POST /puts
  # POST /puts.json
  def create
    @put = Put.new(put_params)

    respond_to do |format|
      if @put.save
        format.html { redirect_to admin_puts_url, notice: 'Put was successfully created.' }
        format.json { render :show, status: :created, location: @put }
      else
        format.html { render :new }
        format.json { render json: @put.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puts/1
  # PATCH/PUT /puts/1.json
  def update
    respond_to do |format|
      if @put.update(put_params)
        format.html { redirect_to admin_puts_url, notice: 'Put was successfully updated.' }
        format.json { render :show, status: :ok, location: @put }
      else
        format.html { render :edit }
        format.json { render json: @put.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puts/1
  # DELETE /puts/1.json
  def destroy
    @put.destroy
    respond_to do |format|
      format.html { redirect_to admin_puts_url, notice: 'Put was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_put
      @put = Put.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def put_params
      params.require(:put).permit(:br_stock_id, :expiration_id, :ticker, :strike, :price, :is_disable)
    end
end
