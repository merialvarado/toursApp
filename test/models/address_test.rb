require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @address = addresses(:one)
  end

  test "should be valid" do
    assert @address.valid?
  end

  test "street should be present" do
    @address.street = "     "
    assert_not @address.valid?
  end


  test "street should not be too long" do
    @address.street = "a" * 51
    assert_not @address.valid?
  end

  test "region id should be present" do
    @address.region_id = nil
    assert_not @address.valid?
  end

  test "enterprise id should be present" do
    @address.enterprise_id = nil
    assert_not @address.valid?
  end

end
