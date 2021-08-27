require 'test_helper'

class PortfolioBrStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_br_stock = portfolio_br_stocks(:one)
  end

  test "should get index" do
    get portfolio_br_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_br_stock_url
    assert_response :success
  end

  test "should create portfolio_br_stock" do
    assert_difference('PortfolioBrStock.count') do
      post portfolio_br_stocks_url, params: { portfolio_br_stock: { amount: @portfolio_br_stock.amount, br_stock_id: @portfolio_br_stock.br_stock_id, category_id: @portfolio_br_stock.category_id, portfolio_id: @portfolio_br_stock.portfolio_id, share_cost: @portfolio_br_stock.share_cost, total_cost: @portfolio_br_stock.total_cost, total_today: @portfolio_br_stock.total_today } }
    end

    assert_redirected_to portfolio_br_stock_url(PortfolioBrStock.last)
  end

  test "should show portfolio_br_stock" do
    get portfolio_br_stock_url(@portfolio_br_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_br_stock_url(@portfolio_br_stock)
    assert_response :success
  end

  test "should update portfolio_br_stock" do
    patch portfolio_br_stock_url(@portfolio_br_stock), params: { portfolio_br_stock: { amount: @portfolio_br_stock.amount, br_stock_id: @portfolio_br_stock.br_stock_id, category_id: @portfolio_br_stock.category_id, portfolio_id: @portfolio_br_stock.portfolio_id, share_cost: @portfolio_br_stock.share_cost, total_cost: @portfolio_br_stock.total_cost, total_today: @portfolio_br_stock.total_today } }
    assert_redirected_to portfolio_br_stock_url(@portfolio_br_stock)
  end

  test "should destroy portfolio_br_stock" do
    assert_difference('PortfolioBrStock.count', -1) do
      delete portfolio_br_stock_url(@portfolio_br_stock)
    end

    assert_redirected_to portfolio_br_stocks_url
  end
end
