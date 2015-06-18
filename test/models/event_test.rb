require 'test_helper'

class EventTest < ActiveSupport::TestCase
  include IceCube

  def setup
    @event = events(:one)
    @event.schedule = schedule = Schedule.new(Date.today)
  end

  test 'should be valid' do
    assert @event.valid?
  end

  test 'event must occurs today' do
    assert @event.schedule.occurs_on?(Date.today)
  end
end
