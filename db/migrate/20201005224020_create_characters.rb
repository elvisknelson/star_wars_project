class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :birth_year
      t.string :gender
      t.string :homeworld
      t.string :species

      t.timestamps
    end
  end
end
