class PackingList < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :packing_list_items
end
