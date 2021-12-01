class Admin::FiisController < AdminController
    before_action :set_fii, only: [:show, :edit, :update, :destroy]
  
    # GET /fiis
    # GET /fiis.json
    def index
      @fiis = Fii.all
    end
  
    # GET /fiis/1
    # GET /fiis/1.json
    def show
    end
  
    # GET /fiis/new
    def new
      @fii = Fii.new
    end
  
    # GET /fiis/1/edit
    def edit
    end
  
    # POST /fiis
    # POST /fiis.json
    def create
      @fii = Fii.new(fii_params)
  
      respond_to do |format|
        if @fii.save
          format.html { redirect_to admin_fiis_url, notice: 'Fii was successfully created.' }
          format.json { render :show, status: :created, location: @fii }
        else
          format.html { render :new }
          format.json { render json: @fii.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /fiis/1
    # PATCH/PUT /fiis/1.json
    def update
      respond_to do |format|
        if @fii.update(fii_params)
          format.html { redirect_to admin_fiis_url, notice: 'Fii was successfully updated.' }
          format.json { render :show, status: :ok, location: @fii }
        else
          format.html { render :edit }
          format.json { render json: @fii.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /fiis/1
    # DELETE /fiis/1.json
    def destroy
      @fii.destroy
      respond_to do |format|
        format.html { redirect_to admin_fiis_url, notice: 'Fii was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_fii
        @fii = Fii.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def fii_params
        params.require(:fii).permit(:ticker, :title, :slug, :price, :setor)
      end
  end
  