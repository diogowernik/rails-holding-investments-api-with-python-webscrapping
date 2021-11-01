require "application_system_test_case"

class DividendsTest < ApplicationSystemTestCase
  setup do
    @dividend = dividends(:one)
  end

  test "visiting the index" do
    visit dividends_url
    assert_selector "h1", text: "Dividends"
  end

  test "creating a Dividend" do
    visit dividends_url
    click_on "New Dividend"

    fill_in "Br stocks", with: @dividend.br_stocks
    fill_in "Criptos", with: @dividend.criptos
    fill_in "Derivatives", with: @dividend.derivatives
    fill_in "Equities", with: @dividend.equities
    fill_in "Fiis", with: @dividend.fiis
    fill_in "International", with: @dividend.international
    fill_in "Month", with: @dividend.month_id
    fill_in "Properties", with: @dividend.properties
    fill_in "Year", with: @dividend.year_id
    click_on "Create Dividend"

    assert_text "Dividend was successfully created"
    click_on "Back"
  end

  test "updating a Dividend" do
    visit dividends_url
    click_on "Edit", match: :first

    fill_in "Br stocks", with: @dividend.br_stocks
    fill_in "Criptos", with: @dividend.criptos
    fill_in "Derivatives", with: @dividend.derivatives
    fill_in "Equities", with: @dividend.equities
    fill_in "Fiis", with: @dividend.fiis
    fill_in "International", with: @dividend.international
    fill_in "Month", with: @dividend.month_id
    fill_in "Properties", with: @dividend.properties
    fill_in "Year", with: @dividend.year_id
    click_on "Update Dividend"

    assert_text "Dividend was successfully updated"
    click_on "Back"
  end

  test "destroying a Dividend" do
    visit dividends_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dividend was successfully destroyed"
  end
end
