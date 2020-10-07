class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :model
      t.string :pilot

      t.timestamps
    end
  end
end
