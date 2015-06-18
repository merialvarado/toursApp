class AddEnterpriseToProgram < ActiveRecord::Migration
  def change
    add_reference :programs, :enterprise, index: true
    add_foreign_key :programs, :enterprises
  end
end
