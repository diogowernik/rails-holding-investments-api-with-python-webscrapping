require "application_system_test_case"

class FiisTest < ApplicationSystemTestCase
  setup do
    @fii = fiis(:one)
  end

  test "visiting the index" do
    visit fiis_url
    assert_selector "h1", text: "Fiis"
  end

  test "creating a Fii" do
    visit fiis_url
    click_on "New Fii"

    fill_in "Price", with: @fii.price
    fill_in "Slug", with: @fii.slug
    fill_in "Ticker", with: @fii.ticker
    fill_in "Title", with: @fii.title
    click_on "Create Fii"

    assert_text "Fii was successfully created"
    click_on "Back"
  end

  test "updating a Fii" do
    visit fiis_url
    click_on "Edit", match: :first

    fill_in "Price", with: @fii.price
    fill_in "Slug", with: @fii.slug
    fill_in "Ticker", with: @fii.ticker
    fill_in "Title", with: @fii.title
    click_on "Update Fii"

    assert_text "Fii was successfully updated"
    click_on "Back"
  end

  test "destroying a Fii" do
    visit fiis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fii was successfully destroyed"
  end
end
