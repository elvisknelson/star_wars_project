class AddColumnsToHomeworlds < ActiveRecord::Migration[6.0]
  def change
    add_column :homeworlds, :diameter, :integer
    add_column :homeworlds, :gravity, :string
    add_column :homeworlds, :terrain, :string
    add_column :homeworlds, :surface_water, :string
    add_column :homeworlds, :population, :integer
  end
end
