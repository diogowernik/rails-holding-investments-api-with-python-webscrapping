require "application_system_test_case"

class CriptoDividendsTest < ApplicationSystemTestCase
  setup do
    @cripto_dividend = cripto_dividends(:one)
  end

  test "visiting the index" do
    visit cripto_dividends_url
    assert_selector "h1", text: "Cripto Dividends"
  end

  test "creating a Cripto dividend" do
    visit cripto_dividends_url
    click_on "New Cripto Dividend"

    fill_in "Category", with: @cripto_dividend.category_id
    fill_in "Fii", with: @cripto_dividend.fii_id
    fill_in "Month", with: @cripto_dividend.month_id
    fill_in "Pay date", with: @cripto_dividend.pay_date
    fill_in "Portfolio fii", with: @cripto_dividend.portfolio_fii_id
    fill_in "Record date", with: @cripto_dividend.record_date
    fill_in "Total", with: @cripto_dividend.total
    fill_in "Value per share", with: @cripto_dividend.value_per_share
    fill_in "Year", with: @cripto_dividend.year_id
    fill_in "Yield on cost", with: @cripto_dividend.yield_on_cost
    click_on "Create Cripto dividend"

    assert_text "Cripto dividend was successfully created"
    click_on "Back"
  end

  test "updating a Cripto dividend" do
    visit cripto_dividends_url
    click_on "Edit", match: :first

    fill_in "Category", with: @cripto_dividend.category_id
    fill_in "Fii", with: @cripto_dividend.fii_id
    fill_in "Month", with: @cripto_dividend.month_id
    fill_in "Pay date", with: @cripto_dividend.pay_date
    fill_in "Portfolio fii", with: @cripto_dividend.portfolio_fii_id
    fill_in "Record date", with: @cripto_dividend.record_date
    fill_in "Total", with: @cripto_dividend.total
    fill_in "Value per share", with: @cripto_dividend.value_per_share
    fill_in "Year", with: @cripto_dividend.year_id
    fill_in "Yield on cost", with: @cripto_dividend.yield_on_cost
    click_on "Update Cripto dividend"

    assert_text "Cripto dividend was successfully updated"
    click_on "Back"
  end

  test "destroying a Cripto dividend" do
    visit cripto_dividends_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cripto dividend was successfully destroyed"
  end
end
