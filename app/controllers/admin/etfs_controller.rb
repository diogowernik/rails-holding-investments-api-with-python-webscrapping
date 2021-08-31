class Admin::EtfsController < AdminController
  before_action :set_etf, only: [:show, :edit, :update, :destroy]

  # GET /etfs
  # GET /etfs.json
  def index
    @etfs = Etf.all
  end

  # GET /etfs/1
  # GET /etfs/1.json
  def show
  end

  # GET /etfs/new
  def new
    @etf = Etf.new
  end

  # GET /etfs/1/edit
  def edit
  end

  # POST /etfs
  # POST /etfs.json
  def create
    @etf = Etf.new(etf_params)

    respond_to do |format|
      if @etf.save
        format.html { redirect_to admin_etfs_url, notice: 'Etf was successfully created.' }
        format.json { render :show, status: :created, location: @etf }
      else
        format.html { render :new }
        format.json { render json: @etf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etfs/1
  # PATCH/PUT /etfs/1.json
  def update
    respond_to do |format|
      if @etf.update(etf_params)
        format.html { redirect_to admin_etfs_url, notice: 'Etf was successfully updated.' }
        format.json { render :show, status: :ok, location: @etf }
      else
        format.html { render :edit }
        format.json { render json: @etf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etfs/1
  # DELETE /etfs/1.json
  def destroy
    @etf.destroy
    respond_to do |format|
      format.html { redirect_to admin_etfs_url, notice: 'Etf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etf
      @etf = Etf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def etf_params
      params.require(:etf).permit(:ticker, :title, :slug, :price)
    end
end
