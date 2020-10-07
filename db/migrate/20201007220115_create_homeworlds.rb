class CreateHomeworlds < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworlds do |t|
      t.string :name
      t.integer :rotatio_period
      t.string :climate

      t.timestamps
    end
  end
end
