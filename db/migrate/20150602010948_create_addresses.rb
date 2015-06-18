class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :postal_code
      t.float :latitude
      t.float :longitude
      t.references :region, index: true
      t.references :enterprise, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :regions
    add_foreign_key :addresses, :enterprises
  end
end
