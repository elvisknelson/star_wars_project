class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :designation

      t.timestamps
    end
  end
end
