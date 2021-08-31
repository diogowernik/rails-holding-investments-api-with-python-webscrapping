class Admin::HoldingTokensController < AdminController
  before_action :set_holding_token, only: [:show, :edit, :update, :destroy]

  # GET /holding_tokens
  # GET /holding_tokens.json
  def index
    @holding_tokens = HoldingToken.all
  end

  # GET /holding_tokens/1
  # GET /holding_tokens/1.json
  def show
  end

  # GET /holding_tokens/new
  def new
    @holding_token = HoldingToken.new
  end

  # GET /holding_tokens/1/edit
  def edit
  end

  # POST /holding_tokens
  # POST /holding_tokens.json
  def create
    @holding_token = HoldingToken.new(holding_token_params)

    respond_to do |format|
      if @holding_token.save
        format.html { redirect_to admin_holding_tokens_url, notice: 'Holding token was successfully created.' }
        format.json { render :show, status: :created, location: @holding_token }
      else
        format.html { render :new }
        format.json { render json: @holding_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holding_tokens/1
  # PATCH/PUT /holding_tokens/1.json
  def update
    respond_to do |format|
      if @holding_token.update(holding_token_params)
        format.html { redirect_to admin_holding_tokens_url, notice: 'Holding token was successfully updated.' }
        format.json { render :show, status: :ok, location: @holding_token }
      else
        format.html { render :edit }
        format.json { render json: @holding_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holding_tokens/1
  # DELETE /holding_tokens/1.json
  def destroy
    @holding_token.destroy
    respond_to do |format|
      format.html { redirect_to admin_holding_tokens_url, notice: 'Holding token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holding_token
      @holding_token = HoldingToken.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def holding_token_params
      params.require(:holding_token).permit(:ticker, :title, :slug, :price)
    end
end
