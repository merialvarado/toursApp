class ScheduleDate < ActiveRecord::Base
	include IceCube

  serialize :schedule, IceCube::Schedule

  EVENT_REPEATING_RULES = [
    ["Daily", "daily"],
    ["Weekly", "weekly"],
    ["Yearly", "yearly"]
  ]

  def schedule
    Schedule.new(repeat_from_date) do |s|
      s.add_recurrence_rule Rule.daily(1).count(7)
    end
  end

  def self.get_days_of_week
    days = []
    Date::DAYNAMES.each{|a| days << [a,a]}
    days
  end
end
