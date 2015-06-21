class AddRepeatingEveryYearlyToScheduleDates < ActiveRecord::Migration
  def change
    add_column :schedule_dates, :repeating_every_month, :integer
    add_column :schedule_dates, :repeating_every_day, :integer
  end
end
