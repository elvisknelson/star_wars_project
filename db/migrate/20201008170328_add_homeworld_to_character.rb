class AddHomeworldToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :homeworld, null: false, foreign_key: true
  end
end
