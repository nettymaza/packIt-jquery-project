class AddStartDateToTrips < ActiveRecord::Migration[5.1]
  def change
      add_column :trips, :start_date, :date
  end
end
