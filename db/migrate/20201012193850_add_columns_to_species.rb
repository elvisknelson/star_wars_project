class AddColumnsToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :average_height, :integer
    add_column :species, :language, :string
    add_column :species, :average_lifespan, :integer
  end
end
