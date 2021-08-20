class Api::FiisController < ApplicationController
  before_action :set_fii, only: [:show, :update, :destroy]

  # GET /fiis
  def index
    @fiis = Fii.all

    render json: @fiis.order("id desc")
  end

  def options
    @fiis = Fii.all
    render 'api/fiis/options.json.jbuilder'
  end

  # GET /fiis/1
  def show
    render json: @fii
  end

  # POST /fiis
  def create
    @fii = Fii.new(fii_params)

    if @fii.save
      render json: @fii, status: :created
    else
      render json: @fii.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fiis/1
  def update
    if @fii.update(fii_params)
      render json: @fii
    else
      render json: @fii.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fiis/1
  def destroy
    @fii.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fii
      @fii = Fii.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fii_params
      params.require(:fii).permit(:ticker, :title, :slug, :price)
    end
end
