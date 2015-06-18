require 'test_helper'

class EnterpriseTest < ActiveSupport::TestCase

  def setup
  	@enterprise = enterprises(:one)
  end

  test "should be valid" do
    assert @enterprise.valid?
  end

  test "user id should be present" do
    @enterprise.user_id = nil
    assert_not @enterprise.valid?
  end

  test "name should be present" do
    @enterprise.name = "     "
    assert_not @enterprise.valid?
  end

  test "name should not be too long" do
    @enterprise.name = "a" * 51
    assert_not @enterprise.valid?
  end

  test "description should not be too long" do
    @enterprise.description = "a" * 1001
    assert_not @enterprise.valid?
  end

  test "associated address should be destroyed" do
    @enterprise = enterprises(:one)
    assert_difference 'Address.count', -1 do
      @enterprise.destroy
    end
  end
end
