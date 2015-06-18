class AddPhoneNumberToEnterprises < ActiveRecord::Migration
  def change
  	add_column :enterprises, :phone_number, :string
  end
end
