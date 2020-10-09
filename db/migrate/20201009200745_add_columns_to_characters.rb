class AddColumnsToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :mass, :integer
    add_column :characters, :hair_color, :string
    add_column :characters, :skin_color, :string
    add_column :characters, :eye_color, :string
    add_column :characters, :height, :integer
  end
end
