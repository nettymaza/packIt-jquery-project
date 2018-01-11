class AddPackingListIdToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :packing_list_id, :integer
  end
end
