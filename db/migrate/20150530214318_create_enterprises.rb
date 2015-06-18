class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name
      t.text :description
      t.references :region, index: true

      t.timestamps null: false
    end
    add_foreign_key :enterprises, :regions
  end
end
