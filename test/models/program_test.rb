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

  test "program can have many schedule" do
    schedule_date1 = @program.schedule_dates.build( event_repeats: "daily", from_time: "2000-01-01 16:36:00", to_time: "2000-01-01 16:36:00", repeat_from_date: "2015-07-01", repeat_to_date: "2015-07-31" )
    schedule_date2 = @program.schedule_dates.build( event_repeats: "daily", from_time: "2000-01-01 16:36:00", to_time: "2000-01-01 16:36:00", repeat_from_date: "2015-08-01", repeat_to_date: "2015-08-30" ) 
    assert @program.valid?
    assert @program.schedule_dates.size == 2
  end

  test "associated schedules should be destroyed when program is destroyed" do
    schedule_date1 = @program.schedule_dates.build( event_repeats: "daily", from_time: "2000-01-01 16:36:00", to_time: "2000-01-01 16:36:00", repeat_from_date: "2015-07-01", repeat_to_date: "2015-07-31" )
    schedule_date2 = @program.schedule_dates.build( event_repeats: "daily", from_time: "2000-01-01 16:36:00", to_time: "2000-01-01 16:36:00", repeat_from_date: "2015-08-01", repeat_to_date: "2015-08-30" ) 
    @program.save
    schedule_date_ids = @program.schedule_dates.pluck(:id)
    @program.destroy

    assert ScheduleDate.where(:id => schedule_date_ids[0]).empty?
    assert ScheduleDate.where(:id => schedule_date_ids[1]).empty?
  end

  test "program occurs on" do
    # Schedule occurs on July 1 - July 31 from 00:01 am - 01:00 am
    # Schedule occurs on August 1 - August 30 from 00:01 am - 01:00 am
    schedule_date1 = @program.schedule_dates.build( event_repeats: "daily", from_time: "2000-01-01 00:01:00", to_time: "2000-01-01 03:00:00", repeat_from_date: "2015-07-01", repeat_to_date: "2015-07-31" )
    schedule_date2 = @program.schedule_dates.build( event_repeats: "daily", from_time: "2000-01-01 00:01:00", to_time: "2000-01-01 03:00:00", repeat_from_date: "2015-08-01", repeat_to_date: "2015-08-30" ) 
    @program.save

    #puts @program.occurrences

    # Assert July 1 - July 31
    (1..31).each do |day|
      assert @program.occurs_at?(Time.parse("2015-07-#{day} 00:01:00 +0800"))
    end

    # Assert August 1 - August 30
    (1..30).each do |day|
      assert @program.occurs_at?(Time.parse("2015-08-#{day} 00:01:00 +0800"))
    end

    # Assert that September 1 is not included on the schedule
    assert_not @program.occurs_at?(Time.parse("2015-09-01 00:01:00 +0800"))
  end

end
