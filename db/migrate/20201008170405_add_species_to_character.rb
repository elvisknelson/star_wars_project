class AddSpeciesToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :species, null: false, foreign_key: true
  end
end
