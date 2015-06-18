class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :description
      t.belongs_to :province, index: true

      t.timestamps null: false
    end
    add_foreign_key :regions, :provinces
  end
end
