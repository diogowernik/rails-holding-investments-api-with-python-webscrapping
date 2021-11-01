require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Month", with: @order.month_id
    fill_in "Month profit", with: @order.month_profit
    fill_in "Order type", with: @order.order_type
    fill_in "Order value", with: @order.order_value
    fill_in "Portfolio", with: @order.portfolio_id
    fill_in "Token price", with: @order.token_price
    fill_in "Tokens amount", with: @order.tokens_amount
    fill_in "Total today", with: @order.total_today
    fill_in "Year", with: @order.year_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Month", with: @order.month_id
    fill_in "Month profit", with: @order.month_profit
    fill_in "Order type", with: @order.order_type
    fill_in "Order value", with: @order.order_value
    fill_in "Portfolio", with: @order.portfolio_id
    fill_in "Token price", with: @order.token_price
    fill_in "Tokens amount", with: @order.tokens_amount
    fill_in "Total today", with: @order.total_today
    fill_in "Year", with: @order.year_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
