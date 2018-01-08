class AddNameToPackingList < ActiveRecord::Migration[5.1]
  def change
    add_column :packing_lists, :name, :string
  end
end
