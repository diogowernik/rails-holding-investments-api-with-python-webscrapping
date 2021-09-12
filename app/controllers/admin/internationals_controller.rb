class Admin::InternationalsController < AdminController
  before_action :set_international, only: [:show, :edit, :update, :destroy]

  # GET /internationals
  # GET /internationals.json
  def index
    @internationals = International.all
  end

  # GET /internationals/1
  # GET /internationals/1.json
  def show
  end

  # GET /internationals/new
  def new
    @international = International.new
  end

  # GET /internationals/1/edit
  def edit
  end

  # POST /internationals
  # POST /internationals.json
  def create
    @international = International.new(international_params)

    respond_to do |format|
      if @international.save
        format.html { redirect_to admin_internationals_url, notice: 'International was successfully created.' }
        format.json { render :show, status: :created, location: @international }
      else
        format.html { render :new }
        format.json { render json: @international.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internationals/1
  # PATCH/PUT /internationals/1.json
  def update
    respond_to do |format|
      if @international.update(international_params)
        format.html { redirect_to admin_internationals_url, notice: 'International was successfully updated.' }
        format.json { render :show, status: :ok, location: @international }
      else
        format.html { render :edit }
        format.json { render json: @international.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internationals/1
  # DELETE /internationals/1.json
  def destroy
    @international.destroy
    respond_to do |format|
      format.html { redirect_to admin_internationals_url, notice: 'International was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_international
      @international = International.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def international_params
      params.require(:international).permit(:international_category_id, :ticker, :title, :slug, :price)
    end
end
