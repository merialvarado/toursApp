json.array!(@schedule_dates) do |schedule_date|
  json.extract! schedule_date, :id, :event_repeats, :repeating_every, :from_time, :to_time, :repeat_from_date, :repeat_to_date
  json.url schedule_date_url(schedule_date, format: :json)
end
