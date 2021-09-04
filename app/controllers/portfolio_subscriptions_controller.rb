class PortfolioSubscriptionsController < ApplicationController
  before_action :set_portfolio_subscription, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_subscriptions
  # GET /portfolio_subscriptions.json
  def index
    @portfolio_subscriptions = PortfolioSubscription.all
  end

  # GET /portfolio_subscriptions/1
  # GET /portfolio_subscriptions/1.json
  def show
  end

  # GET /portfolio_subscriptions/new
  def new
    @portfolio_subscription = PortfolioSubscription.new
  end

  # GET /portfolio_subscriptions/1/edit
  def edit
  end

  # POST /portfolio_subscriptions
  # POST /portfolio_subscriptions.json
  def create
    @portfolio_subscription = PortfolioSubscription.new(portfolio_subscription_params)

    respond_to do |format|
      if @portfolio_subscription.save
        format.html { redirect_to portfolio_derivatives_path(@portfolio_subscription.portfolio.id), notice: 'Portfolio subscription was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_subscription }
      else
        format.html { render :new }
        format.json { render json: @portfolio_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_subscriptions/1
  # PATCH/PUT /portfolio_subscriptions/1.json
  def update
    respond_to do |format|
      if @portfolio_subscription.update(portfolio_subscription_params)
        format.html { redirect_to portfolio_derivatives_path(@portfolio_subscription.portfolio.id), notice: 'Portfolio subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_subscription }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_subscriptions/1
  # DELETE /portfolio_subscriptions/1.json
  def destroy
    @portfolio_subscription.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_derivatives_path(@portfolio_subscription.portfolio.id), notice: 'Portfolio subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_subscription
      @portfolio_subscription = PortfolioSubscription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_subscription_params
      params.require(:portfolio_subscription).permit(:category_id, :portfolio_id, :subscription_id, :shares_amount, :share_cost, :total_cost, :total_today)
    end
end
