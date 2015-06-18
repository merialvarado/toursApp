class Event < ActiveRecord::Base
  include IceCube

  belongs_to :program
  
  # @return [IceCube::Schedule]
  serialize :schedule, Hash

  def schedule=(new_schedule)
    write_attribute(:schedule, new_schedule.to_hash)
  end

  def schedule
    Schedule.from_hash(read_attribute(:schedule))
  end
end
