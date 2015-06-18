class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :schedule
      t.references :program, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :programs
  end
end
