class RemoveForeignKeysFromPackingLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :packing_lists, :user_id, :trip_id
  end
end
