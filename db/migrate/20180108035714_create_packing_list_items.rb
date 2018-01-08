class CreatePackingListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :packing_list_items do |t|
      t.string :name
      t.integer :packing_list_id
      t.timestamps
    end
  end
end
