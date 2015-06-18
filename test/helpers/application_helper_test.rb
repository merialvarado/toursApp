require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Full Wines App"
    assert_equal full_title("Faq"), "Faq | Full Wines App"
  end
end