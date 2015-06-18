class AddPictureToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :picture, :string
  end
end
