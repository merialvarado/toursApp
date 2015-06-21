class CreateScheduleDates < ActiveRecord::Migration
  def change
    create_table :schedule_dates do |t|
      t.string :event_repeats
      t.string :repeating_every, :string, :array => true, :default => {}
      t.time :from_time
      t.time :to_time
      t.date :repeat_from_date
      t.date :repeat_to_date
      t.text :schedule

      t.timestamps null: false
    end
  end
end
