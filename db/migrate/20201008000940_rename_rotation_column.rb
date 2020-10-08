class RenameRotationColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :homeworlds, :rotatio_period, :rotation_period
  end
end
