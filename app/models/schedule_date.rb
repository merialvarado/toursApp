class ScheduleDate < ActiveRecord::Base
	include IceCube

  serialize :schedule, IceCube::Schedule

  EVENT_REPEATING_RULES = [
    ["Daily", "daily"],
    ["Weekly", "weekly"],
    ["Yearly", "yearly"]
  ]

  validates :event_repeats, :repeat_from_date, :repeat_to_date, :to_time, :from_time, :presence => true
  validate :repeating_every_presence, :if => lambda{|a| a.event_repeats == "weekly"}
  validates :repeating_every_month, :repeating_every_day, :presence => true, :if => lambda{|a| a.event_repeats == "yearly"}

  def schedule
    Schedule.new(Time.parse([repeat_from_date, from_time.strftime("%I:%M %P")].join(" ")), :end_time => Time.parse([repeat_to_date, to_time.strftime("%I:%M %P")].join(" "))) do |s|
      rule = Rule.send(event_repeats)
      case event_repeats
        when "weekly"
          rule = rule.day(eval(repeating_every).map{|a| a.to_i})
        when "yearly"
          rule = rule.day_of_month(repeating_every_day).month_of_year(repeating_every_month)
        end

      s.add_recurrence_rule rule
    end
  end

  def repeating_every_presence
    self.errors.add(:repeating_every, "can't be blank") if eval(repeating_every).empty? || eval(repeating_every).blank?
  end

  def self.get_days_of_week
    Date::DAYNAMES.each_with_index.collect{|d, i| [d, i]}
  end

  def self.get_months
    Date::MONTHNAMES.each_with_index.collect{|m, i| [m, i]}
  end

  def repeating_every_week
    weeks = []
    eval(repeating_every).each do |week|
      weeks << Date::DAYNAMES[week.to_i]
    end
    weeks.join(", ")
  end
end
