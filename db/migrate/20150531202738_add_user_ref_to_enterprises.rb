class AddUserRefToEnterprises < ActiveRecord::Migration
  def change
    add_reference :enterprises, :user, index: true
    add_foreign_key :enterprises, :users
  end
end
