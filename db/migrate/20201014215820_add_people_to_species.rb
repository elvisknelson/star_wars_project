class AddPeopleToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :people, :string
  end
end
