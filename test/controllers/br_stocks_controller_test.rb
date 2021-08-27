require 'test_helper'

class BrStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @br_stock = br_stocks(:one)
  end

  test "should get index" do
    get br_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_br_stock_url
    assert_response :success
  end

  test "should create br_stock" do
    assert_difference('BrStock.count') do
      post br_stocks_url, params: { br_stock: { price: @br_stock.price, slug: @br_stock.slug, ticker: @br_stock.ticker, title: @br_stock.title } }
    end

    assert_redirected_to br_stock_url(BrStock.last)
  end

  test "should show br_stock" do
    get br_stock_url(@br_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_br_stock_url(@br_stock)
    assert_response :success
  end

  test "should update br_stock" do
    patch br_stock_url(@br_stock), params: { br_stock: { price: @br_stock.price, slug: @br_stock.slug, ticker: @br_stock.ticker, title: @br_stock.title } }
    assert_redirected_to br_stock_url(@br_stock)
  end

  test "should destroy br_stock" do
    assert_difference('BrStock.count', -1) do
      delete br_stock_url(@br_stock)
    end

    assert_redirected_to br_stocks_url
  end
end
