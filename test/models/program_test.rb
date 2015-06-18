require 'test_helper'

class ProgramTest < ActiveSupport::TestCase

  def setup
    @user = users(:pablo)
    @enterprise = enterprises(:one)
    @program = @user.programs.build(description: "Lorem ipsum", name: "programa 1", price: 110, enterprise_id: @enterprise.id)
  end

  test "should be valid" do
    assert @program.valid?
  end

  test "user id should be present" do
    @program.user_id = nil
    assert_not @program.valid?
  end

  test "name should be present" do
    @program.name = "     "
    assert_not @program.valid?
  end

  test "name should not be too long" do
    @program.name = "a" * 51
    assert_not @program.valid?
  end

  test "description should not be too long" do
    @program.description = "a" * 244 + "@example.com"
    assert_not @program.valid?
  end

  test "price should be decimal" do
    @program.price = 199.99
    assert @program.valid?
  end

end
