class AddPostalCodeToEnterprises < ActiveRecord::Migration
  def change
  	add_column :enterprises, :postal_code, :string
  end
end
