require "application_system_test_case"

class PortfolioCriptosTest < ApplicationSystemTestCase
  setup do
    @portfolio_cripto = portfolio_criptos(:one)
  end

  test "visiting the index" do
    visit portfolio_criptos_url
    assert_selector "h1", text: "Portfolio Criptos"
  end

  test "creating a Portfolio cripto" do
    visit portfolio_criptos_url
    click_on "New Portfolio Cripto"

    fill_in "Amount", with: @portfolio_cripto.amount
    fill_in "Category", with: @portfolio_cripto.category_id
    fill_in "Cripto", with: @portfolio_cripto.cripto_id
    fill_in "Portfolio", with: @portfolio_cripto.portfolio_id
    fill_in "Share cost", with: @portfolio_cripto.share_cost
    fill_in "Total cost", with: @portfolio_cripto.total_cost
    fill_in "Total today", with: @portfolio_cripto.total_today
    click_on "Create Portfolio cripto"

    assert_text "Portfolio cripto was successfully created"
    click_on "Back"
  end

  test "updating a Portfolio cripto" do
    visit portfolio_criptos_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @portfolio_cripto.amount
    fill_in "Category", with: @portfolio_cripto.category_id
    fill_in "Cripto", with: @portfolio_cripto.cripto_id
    fill_in "Portfolio", with: @portfolio_cripto.portfolio_id
    fill_in "Share cost", with: @portfolio_cripto.share_cost
    fill_in "Total cost", with: @portfolio_cripto.total_cost
    fill_in "Total today", with: @portfolio_cripto.total_today
    click_on "Update Portfolio cripto"

    assert_text "Portfolio cripto was successfully updated"
    click_on "Back"
  end

  test "destroying a Portfolio cripto" do
    visit portfolio_criptos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Portfolio cripto was successfully destroyed"
  end
end
