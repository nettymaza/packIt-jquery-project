class PackingList < ApplicationRecord
  has_one :trip
  has_one :user, through: :trip
  has_many :packing_list_items
end
