class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
      rename_column :trips, :destination, :name
  end
end
