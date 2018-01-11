class RemoveForeignKeyFromPackingLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :packing_lists, :trip_id
  end
end
