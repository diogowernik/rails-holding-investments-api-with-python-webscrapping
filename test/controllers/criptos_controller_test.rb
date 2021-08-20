require 'test_helper'

class CriptosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cripto = criptos(:one)
  end

  test "should get index" do
    get criptos_url
    assert_response :success
  end

  test "should get new" do
    get new_cripto_url
    assert_response :success
  end

  test "should create cripto" do
    assert_difference('Cripto.count') do
      post criptos_url, params: { cripto: { price: @cripto.price, slug: @cripto.slug, ticker: @cripto.ticker, title: @cripto.title } }
    end

    assert_redirected_to cripto_url(Cripto.last)
  end

  test "should show cripto" do
    get cripto_url(@cripto)
    assert_response :success
  end

  test "should get edit" do
    get edit_cripto_url(@cripto)
    assert_response :success
  end

  test "should update cripto" do
    patch cripto_url(@cripto), params: { cripto: { price: @cripto.price, slug: @cripto.slug, ticker: @cripto.ticker, title: @cripto.title } }
    assert_redirected_to cripto_url(@cripto)
  end

  test "should destroy cripto" do
    assert_difference('Cripto.count', -1) do
      delete cripto_url(@cripto)
    end

    assert_redirected_to criptos_url
  end
end
