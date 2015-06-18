require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", faq_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get new_user_registration_path
    assert_select "title", full_title("Sign up")
  end
end