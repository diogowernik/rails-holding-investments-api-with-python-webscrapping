require 'test_helper'

class CriptoDividendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cripto_dividend = cripto_dividends(:one)
  end

  test "should get index" do
    get cripto_dividends_url
    assert_response :success
  end

  test "should get new" do
    get new_cripto_dividend_url
    assert_response :success
  end

  test "should create cripto_dividend" do
    assert_difference('CriptoDividend.count') do
      post cripto_dividends_url, params: { cripto_dividend: { category_id: @cripto_dividend.category_id, fii_id: @cripto_dividend.fii_id, month_id: @cripto_dividend.month_id, pay_date: @cripto_dividend.pay_date, portfolio_fii_id: @cripto_dividend.portfolio_fii_id, record_date: @cripto_dividend.record_date, total: @cripto_dividend.total, value_per_share: @cripto_dividend.value_per_share, year_id: @cripto_dividend.year_id, yield_on_cost: @cripto_dividend.yield_on_cost } }
    end

    assert_redirected_to cripto_dividend_url(CriptoDividend.last)
  end

  test "should show cripto_dividend" do
    get cripto_dividend_url(@cripto_dividend)
    assert_response :success
  end

  test "should get edit" do
    get edit_cripto_dividend_url(@cripto_dividend)
    assert_response :success
  end

  test "should update cripto_dividend" do
    patch cripto_dividend_url(@cripto_dividend), params: { cripto_dividend: { category_id: @cripto_dividend.category_id, fii_id: @cripto_dividend.fii_id, month_id: @cripto_dividend.month_id, pay_date: @cripto_dividend.pay_date, portfolio_fii_id: @cripto_dividend.portfolio_fii_id, record_date: @cripto_dividend.record_date, total: @cripto_dividend.total, value_per_share: @cripto_dividend.value_per_share, year_id: @cripto_dividend.year_id, yield_on_cost: @cripto_dividend.yield_on_cost } }
    assert_redirected_to cripto_dividend_url(@cripto_dividend)
  end

  test "should destroy cripto_dividend" do
    assert_difference('CriptoDividend.count', -1) do
      delete cripto_dividend_url(@cripto_dividend)
    end

    assert_redirected_to cripto_dividends_url
  end
end
