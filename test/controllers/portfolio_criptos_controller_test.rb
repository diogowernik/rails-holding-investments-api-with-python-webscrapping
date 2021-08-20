require 'test_helper'

class PortfolioCriptosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_cripto = portfolio_criptos(:one)
  end

  test "should get index" do
    get portfolio_criptos_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_cripto_url
    assert_response :success
  end

  test "should create portfolio_cripto" do
    assert_difference('PortfolioCripto.count') do
      post portfolio_criptos_url, params: { portfolio_cripto: { amount: @portfolio_cripto.amount, category_id: @portfolio_cripto.category_id, cripto_id: @portfolio_cripto.cripto_id, portfolio_id: @portfolio_cripto.portfolio_id, share_cost: @portfolio_cripto.share_cost, total_cost: @portfolio_cripto.total_cost, total_today: @portfolio_cripto.total_today } }
    end

    assert_redirected_to portfolio_cripto_url(PortfolioCripto.last)
  end

  test "should show portfolio_cripto" do
    get portfolio_cripto_url(@portfolio_cripto)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_cripto_url(@portfolio_cripto)
    assert_response :success
  end

  test "should update portfolio_cripto" do
    patch portfolio_cripto_url(@portfolio_cripto), params: { portfolio_cripto: { amount: @portfolio_cripto.amount, category_id: @portfolio_cripto.category_id, cripto_id: @portfolio_cripto.cripto_id, portfolio_id: @portfolio_cripto.portfolio_id, share_cost: @portfolio_cripto.share_cost, total_cost: @portfolio_cripto.total_cost, total_today: @portfolio_cripto.total_today } }
    assert_redirected_to portfolio_cripto_url(@portfolio_cripto)
  end

  test "should destroy portfolio_cripto" do
    assert_difference('PortfolioCripto.count', -1) do
      delete portfolio_cripto_url(@portfolio_cripto)
    end

    assert_redirected_to portfolio_criptos_url
  end
end
