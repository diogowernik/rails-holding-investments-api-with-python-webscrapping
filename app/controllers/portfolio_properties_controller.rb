class PortfolioPropertiesController < ApplicationController
  before_action :set_portfolio_property, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_properties
  # GET /portfolio_properties.json
  def index
    @portfolio_properties = PortfolioProperty.all
  end

  # GET /portfolio_properties/1
  # GET /portfolio_properties/1.json
  def show
  end

  # GET /portfolio_properties/new
  def new
    @portfolio_property = PortfolioProperty.new
  end

  # GET /portfolio_properties/1/edit
  def edit
  end

  # POST /portfolio_properties
  # POST /portfolio_properties.json
  def create
    @portfolio_property = PortfolioProperty.new(portfolio_property_params)

    respond_to do |format|
      if @portfolio_property.save
        format.html { redirect_to portfolio_properties_management_path(@portfolio_property.portfolio.id), notice: 'Portfolio property was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_property }
      else
        format.html { render :new }
        format.json { render json: @portfolio_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_properties/1
  # PATCH/PUT /portfolio_properties/1.json
  def update
    respond_to do |format|
      if @portfolio_property.update(portfolio_property_params)
        format.html { redirect_to portfolio_properties_management_path(@portfolio_property.portfolio.id), notice: 'Portfolio property was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_property }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_properties/1
  # DELETE /portfolio_properties/1.json
  def destroy
    @portfolio_property.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_properties_management_path(@portfolio_property.portfolio.id), notice: 'Portfolio property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_property
      @portfolio_property = PortfolioProperty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_property_params
      params.require(:portfolio_property).permit(:category_id, :portfolio_id, :property_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
