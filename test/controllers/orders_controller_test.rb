require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { month_id: @order.month_id, month_profit: @order.month_profit, order_type: @order.order_type, order_value: @order.order_value, portfolio_id: @order.portfolio_id, token_price: @order.token_price, tokens_amount: @order.tokens_amount, total_today: @order.total_today, year_id: @order.year_id } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { month_id: @order.month_id, month_profit: @order.month_profit, order_type: @order.order_type, order_value: @order.order_value, portfolio_id: @order.portfolio_id, token_price: @order.token_price, tokens_amount: @order.tokens_amount, total_today: @order.total_today, year_id: @order.year_id } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
