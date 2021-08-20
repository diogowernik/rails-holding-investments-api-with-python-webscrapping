require "application_system_test_case"

class PortfolioFiisTest < ApplicationSystemTestCase
  setup do
    @portfolio_fii = portfolio_fiis(:one)
  end

  test "visiting the index" do
    visit portfolio_fiis_url
    assert_selector "h1", text: "Portfolio Fiis"
  end

  test "creating a Portfolio fii" do
    visit portfolio_fiis_url
    click_on "New Portfolio Fii"

    fill_in "Amount", with: @portfolio_fii.amount
    fill_in "Category", with: @portfolio_fii.category_id
    fill_in "Cripto", with: @portfolio_fii.cripto_id
    fill_in "Portfolio", with: @portfolio_fii.portfolio_id
    fill_in "Share cost", with: @portfolio_fii.share_cost
    fill_in "Total cost", with: @portfolio_fii.total_cost
    fill_in "Total today", with: @portfolio_fii.total_today
    click_on "Create Portfolio fii"

    assert_text "Portfolio fii was successfully created"
    click_on "Back"
  end

  test "updating a Portfolio fii" do
    visit portfolio_fiis_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @portfolio_fii.amount
    fill_in "Category", with: @portfolio_fii.category_id
    fill_in "Cripto", with: @portfolio_fii.cripto_id
    fill_in "Portfolio", with: @portfolio_fii.portfolio_id
    fill_in "Share cost", with: @portfolio_fii.share_cost
    fill_in "Total cost", with: @portfolio_fii.total_cost
    fill_in "Total today", with: @portfolio_fii.total_today
    click_on "Update Portfolio fii"

    assert_text "Portfolio fii was successfully updated"
    click_on "Back"
  end

  test "destroying a Portfolio fii" do
    visit portfolio_fiis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Portfolio fii was successfully destroyed"
  end
end
