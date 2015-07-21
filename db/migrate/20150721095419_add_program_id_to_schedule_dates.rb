class AddProgramIdToScheduleDates < ActiveRecord::Migration
  def change
    add_column :schedule_dates, :program_id, :integer
    add_index :schedule_dates, :program_id
  end
end
