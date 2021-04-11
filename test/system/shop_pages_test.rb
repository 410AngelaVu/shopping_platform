require 'application_system_test_case'

class ShopPagesTest < ApplicationSystemTestCase
  setup do
    @shop_page = shop_pages(:one)
  end

  test 'visiting the index' do
    visit shop_pages_url
    assert_selector 'h1', text: 'Shop Pages'
  end

  test 'creating a Shop page' do
    visit shop_pages_url
    click_on 'New Shop Page'

    fill_in 'Controller', with: @shop_page.controller
    click_on 'Create Shop page'

    assert_text 'Shop page was successfully created'
    click_on 'Back'
  end

  test 'updating a Shop page' do
    visit shop_pages_url
    click_on 'Edit', match: :first

    fill_in 'Controller', with: @shop_page.controller
    click_on 'Update Shop page'

    assert_text 'Shop page was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Shop page' do
    visit shop_pages_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Shop page was successfully destroyed'
  end
end
