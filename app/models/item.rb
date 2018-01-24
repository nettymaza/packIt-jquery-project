class Item < ApplicationRecord
  has_many :packing_lists
  has_one :trip, through: :packing_lists

end
