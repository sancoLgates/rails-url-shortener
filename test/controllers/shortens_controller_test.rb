require 'test_helper'

class ShortensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shorten = shortens(:one)
  end

  test "should get index" do
    get shortens_url
    assert_response :success
  end

  test "should get new" do
    get new_shorten_url
    assert_response :success
  end

  test "should create shorten" do
    assert_difference('Shorten.count') do
      post shortens_url, params: { shorten: { count: @shorten.count, real_url: @shorten.real_url, short_url: @shorten.short_url } }
    end

    assert_redirected_to shorten_url(Shorten.last)
  end

  test "should show shorten" do
    get shorten_url(@shorten)
    assert_response :success
  end

  test "should get edit" do
    get edit_shorten_url(@shorten)
    assert_response :success
  end

  test "should update shorten" do
    patch shorten_url(@shorten), params: { shorten: { count: @shorten.count, real_url: @shorten.real_url, short_url: @shorten.short_url } }
    assert_redirected_to shorten_url(@shorten)
  end

  test "should destroy shorten" do
    assert_difference('Shorten.count', -1) do
      delete shorten_url(@shorten)
    end

    assert_redirected_to shortens_url
  end
end
