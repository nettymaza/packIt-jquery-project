class CreatePackingLists < ActiveRecord::Migration[5.1]
  def change
    create_table :packing_lists do |t|
      t.references :trip, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
