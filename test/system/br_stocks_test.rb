require "application_system_test_case"

class BrStocksTest < ApplicationSystemTestCase
  setup do
    @br_stock = br_stocks(:one)
  end

  test "visiting the index" do
    visit br_stocks_url
    assert_selector "h1", text: "Br Stocks"
  end

  test "creating a Br stock" do
    visit br_stocks_url
    click_on "New Br Stock"

    fill_in "Price", with: @br_stock.price
    fill_in "Slug", with: @br_stock.slug
    fill_in "Ticker", with: @br_stock.ticker
    fill_in "Title", with: @br_stock.title
    click_on "Create Br stock"

    assert_text "Br stock was successfully created"
    click_on "Back"
  end

  test "updating a Br stock" do
    visit br_stocks_url
    click_on "Edit", match: :first

    fill_in "Price", with: @br_stock.price
    fill_in "Slug", with: @br_stock.slug
    fill_in "Ticker", with: @br_stock.ticker
    fill_in "Title", with: @br_stock.title
    click_on "Update Br stock"

    assert_text "Br stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Br stock" do
    visit br_stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Br stock was successfully destroyed"
  end
end
