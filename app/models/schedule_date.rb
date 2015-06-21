class ScheduleDate < ActiveRecord::Base
	include IceCube

  serialize :schedule, IceCube::Schedule

  EVENT_REPEATING_RULES = [
    ["Daily", "daily"],
    ["Weekly", "weekly"],
    ["Yearly", "yearly"]
  ]

  def schedule
    Schedule.new(Time.parse([repeat_from_date, from_time.strftime("%I:%M %P")].join(" ")), :end_time => Time.parse([repeat_to_date, to_time.strftime("%I:%M %P")].join(" "))) do |s|
      rule = Rule.send(event_repeats)
      case event_repeats
        when "weekly"
          rule = rule.day(repeating_every)
        when "yearly"
          rule = rule.day_of_month(repeating_every_yearly.day).month_of_year(repeating_every_yearly.year)
        end

      s.add_recurrence_rule rule
    end
  end

  def self.get_days_of_week
    Date::DAYNAMES.each_with_index.collect{|d, i| [d, i]}
  end

  def self.get_months
    Date::MONTHNAMES.each_with_index.collect{|m, i| [m, i]}
  end

  def repeating_every_week
    weeks = []
    repeating_every.split(",").each do |week|
      weeks << Date::DAYNAMES[week.to_i]
    end
    weeks.join(", ")
  end
end
