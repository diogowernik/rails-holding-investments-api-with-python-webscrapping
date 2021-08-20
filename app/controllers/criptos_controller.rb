class CriptosController < ApplicationController
  before_action :set_cripto, only: [:show, :edit, :update, :destroy]

  # GET /criptos
  # GET /criptos.json
  def index
    @criptos = Cripto.all
  end

  # GET /criptos/1
  # GET /criptos/1.json
  def show
  end

  # GET /criptos/new
  def new
    @cripto = Cripto.new
  end

  # GET /criptos/1/edit
  def edit
  end

  # POST /criptos
  # POST /criptos.json
  def create
    @cripto = Cripto.new(cripto_params)

    respond_to do |format|
      if @cripto.save
        format.html { redirect_to @cripto, notice: 'Cripto was successfully created.' }
        format.json { render :show, status: :created, location: @cripto }
      else
        format.html { render :new }
        format.json { render json: @cripto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criptos/1
  # PATCH/PUT /criptos/1.json
  def update
    respond_to do |format|
      if @cripto.update(cripto_params)
        format.html { redirect_to @cripto, notice: 'Cripto was successfully updated.' }
        format.json { render :show, status: :ok, location: @cripto }
      else
        format.html { render :edit }
        format.json { render json: @cripto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criptos/1
  # DELETE /criptos/1.json
  def destroy
    @cripto.destroy
    respond_to do |format|
      format.html { redirect_to criptos_url, notice: 'Cripto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cripto
      @cripto = Cripto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cripto_params
      params.require(:cripto).permit(:ticker, :title, :slug, :price)
    end
end
