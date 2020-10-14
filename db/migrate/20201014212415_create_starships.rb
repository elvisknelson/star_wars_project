class CreateStarships < ActiveRecord::Migration[6.0]
  def change
    create_table :starships do |t|
      t.string :name
      t.integer :cargo_capacity
      t.string :consumables
      t.integer :crew
      t.float :hyperdrive_rating
      t.string :manufacturer
      t.string :model

      t.timestamps
    end
  end
end
