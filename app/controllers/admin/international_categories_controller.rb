class Admin::InternationalCategoriesController < AdminController
  before_action :set_international_category, only: [:show, :edit, :update, :destroy]

  # GET /international_categories
  # GET /international_categories.json
  def index
    @international_categories = InternationalCategory.all
  end

  # GET /international_categories/1
  # GET /international_categories/1.json
  def show
  end

  # GET /international_categories/new
  def new
    @international_category = InternationalCategory.new
  end

  # GET /international_categories/1/edit
  def edit
  end

  # POST /international_categories
  # POST /international_categories.json
  def create
    @international_category = InternationalCategory.new(international_category_params)

    respond_to do |format|
      if @international_category.save
        format.html { redirect_to admin_international_categories_url, notice: 'International category was successfully created.' }
        format.json { render :show, status: :created, location: @international_category }
      else
        format.html { render :new }
        format.json { render json: @international_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /international_categories/1
  # PATCH/PUT /international_categories/1.json
  def update
    respond_to do |format|
      if @international_category.update(international_category_params)
        format.html { redirect_to admin_international_categories_url, notice: 'International category was successfully updated.' }
        format.json { render :show, status: :ok, location: @international_category }
      else
        format.html { render :edit }
        format.json { render json: @international_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /international_categories/1
  # DELETE /international_categories/1.json
  def destroy
    @international_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_international_categories_url, notice: 'International category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_international_category
      @international_category = InternationalCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def international_category_params
      params.require(:international_category).permit(:title, :slug)
    end
end
