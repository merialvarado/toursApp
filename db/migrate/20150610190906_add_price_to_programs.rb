class AddPriceToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :price, :decimal, precision: 5, scale: 2
  end
end
