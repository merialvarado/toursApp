class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :programs, :users
  end
end
