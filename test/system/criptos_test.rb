require "application_system_test_case"

class CriptosTest < ApplicationSystemTestCase
  setup do
    @cripto = criptos(:one)
  end

  test "visiting the index" do
    visit criptos_url
    assert_selector "h1", text: "Criptos"
  end

  test "creating a Cripto" do
    visit criptos_url
    click_on "New Cripto"

    fill_in "Price", with: @cripto.price
    fill_in "Slug", with: @cripto.slug
    fill_in "Ticker", with: @cripto.ticker
    fill_in "Title", with: @cripto.title
    click_on "Create Cripto"

    assert_text "Cripto was successfully created"
    click_on "Back"
  end

  test "updating a Cripto" do
    visit criptos_url
    click_on "Edit", match: :first

    fill_in "Price", with: @cripto.price
    fill_in "Slug", with: @cripto.slug
    fill_in "Ticker", with: @cripto.ticker
    fill_in "Title", with: @cripto.title
    click_on "Update Cripto"

    assert_text "Cripto was successfully updated"
    click_on "Back"
  end

  test "destroying a Cripto" do
    visit criptos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cripto was successfully destroyed"
  end
end
