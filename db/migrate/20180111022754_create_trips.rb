class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :duration
      t.string :start_date
      t.integer :user_id
      
      t.timestamps
    end
  end
end
