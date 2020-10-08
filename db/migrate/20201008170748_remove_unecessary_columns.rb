class RemoveUnecessaryColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :characters, :homeworld
    remove_column :characters, :species
  end
end
