require 'test_helper'

class ShopPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_page = shop_pages(:one)
  end

  test 'should get index' do
    get shop_pages_url
    assert_response :success
  end

  test 'should get new' do
    get new_shop_page_url
    assert_response :success
  end

  test 'should create shop_page' do
    assert_difference('ShopPage.count') do
      post shop_pages_url, params: { shop_page: { controller: @shop_page.controller } }
    end

    assert_redirected_to shop_page_url(ShopPage.last)
  end

  test 'should show shop_page' do
    get shop_page_url(@shop_page)
    assert_response :success
  end

  test 'should get edit' do
    get edit_shop_page_url(@shop_page)
    assert_response :success
  end

  test 'should update shop_page' do
    patch shop_page_url(@shop_page), params: { shop_page: { controller: @shop_page.controller } }
    assert_redirected_to shop_page_url(@shop_page)
  end

  test 'should destroy shop_page' do
    assert_difference('ShopPage.count', -1) do
      delete shop_page_url(@shop_page)
    end

    assert_redirected_to shop_pages_url
  end
end
