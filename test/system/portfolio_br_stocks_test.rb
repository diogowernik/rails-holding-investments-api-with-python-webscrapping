require "application_system_test_case"

class PortfolioBrStocksTest < ApplicationSystemTestCase
  setup do
    @portfolio_br_stock = portfolio_br_stocks(:one)
  end

  test "visiting the index" do
    visit portfolio_br_stocks_url
    assert_selector "h1", text: "Portfolio Br Stocks"
  end

  test "creating a Portfolio br stock" do
    visit portfolio_br_stocks_url
    click_on "New Portfolio Br Stock"

    fill_in "Amount", with: @portfolio_br_stock.amount
    fill_in "Br stock", with: @portfolio_br_stock.br_stock_id
    fill_in "Category", with: @portfolio_br_stock.category_id
    fill_in "Portfolio", with: @portfolio_br_stock.portfolio_id
    fill_in "Share cost", with: @portfolio_br_stock.share_cost
    fill_in "Total cost", with: @portfolio_br_stock.total_cost
    fill_in "Total today", with: @portfolio_br_stock.total_today
    click_on "Create Portfolio br stock"

    assert_text "Portfolio br stock was successfully created"
    click_on "Back"
  end

  test "updating a Portfolio br stock" do
    visit portfolio_br_stocks_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @portfolio_br_stock.amount
    fill_in "Br stock", with: @portfolio_br_stock.br_stock_id
    fill_in "Category", with: @portfolio_br_stock.category_id
    fill_in "Portfolio", with: @portfolio_br_stock.portfolio_id
    fill_in "Share cost", with: @portfolio_br_stock.share_cost
    fill_in "Total cost", with: @portfolio_br_stock.total_cost
    fill_in "Total today", with: @portfolio_br_stock.total_today
    click_on "Update Portfolio br stock"

    assert_text "Portfolio br stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Portfolio br stock" do
    visit portfolio_br_stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Portfolio br stock was successfully destroyed"
  end
end
