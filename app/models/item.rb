class Item < ApplicationRecord
  has_many :packing_lists
  has_many :trips, through: :packing_lists

  validates :name, presence: true, uniqueness: true
end
