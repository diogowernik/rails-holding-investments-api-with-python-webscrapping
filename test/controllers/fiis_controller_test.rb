require 'test_helper'

class FiisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fii = fiis(:one)
  end

  test "should get index" do
    get fiis_url
    assert_response :success
  end

  test "should get new" do
    get new_fii_url
    assert_response :success
  end

  test "should create fii" do
    assert_difference('Fii.count') do
      post fiis_url, params: { fii: { price: @fii.price, slug: @fii.slug, ticker: @fii.ticker, title: @fii.title } }
    end

    assert_redirected_to fii_url(Fii.last)
  end

  test "should show fii" do
    get fii_url(@fii)
    assert_response :success
  end

  test "should get edit" do
    get edit_fii_url(@fii)
    assert_response :success
  end

  test "should update fii" do
    patch fii_url(@fii), params: { fii: { price: @fii.price, slug: @fii.slug, ticker: @fii.ticker, title: @fii.title } }
    assert_redirected_to fii_url(@fii)
  end

  test "should destroy fii" do
    assert_difference('Fii.count', -1) do
      delete fii_url(@fii)
    end

    assert_redirected_to fiis_url
  end
end
