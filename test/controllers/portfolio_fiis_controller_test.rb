require 'test_helper'

class PortfolioFiisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_fii = portfolio_fiis(:one)
  end

  test "should get index" do
    get portfolio_fiis_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_fii_url
    assert_response :success
  end

  test "should create portfolio_fii" do
    assert_difference('PortfolioFii.count') do
      post portfolio_fiis_url, params: { portfolio_fii: { amount: @portfolio_fii.amount, category_id: @portfolio_fii.category_id, cripto_id: @portfolio_fii.cripto_id, portfolio_id: @portfolio_fii.portfolio_id, share_cost: @portfolio_fii.share_cost, total_cost: @portfolio_fii.total_cost, total_today: @portfolio_fii.total_today } }
    end

    assert_redirected_to portfolio_fii_url(PortfolioFii.last)
  end

  test "should show portfolio_fii" do
    get portfolio_fii_url(@portfolio_fii)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_fii_url(@portfolio_fii)
    assert_response :success
  end

  test "should update portfolio_fii" do
    patch portfolio_fii_url(@portfolio_fii), params: { portfolio_fii: { amount: @portfolio_fii.amount, category_id: @portfolio_fii.category_id, cripto_id: @portfolio_fii.cripto_id, portfolio_id: @portfolio_fii.portfolio_id, share_cost: @portfolio_fii.share_cost, total_cost: @portfolio_fii.total_cost, total_today: @portfolio_fii.total_today } }
    assert_redirected_to portfolio_fii_url(@portfolio_fii)
  end

  test "should destroy portfolio_fii" do
    assert_difference('PortfolioFii.count', -1) do
      delete portfolio_fii_url(@portfolio_fii)
    end

    assert_redirected_to portfolio_fiis_url
  end
end
