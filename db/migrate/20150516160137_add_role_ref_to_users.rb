class AddRoleRefToUsers < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
      t.belongs_to :role, index: true
    end
    #add_reference :users, :role, index: true
    add_foreign_key :users, :roles
  end
end
