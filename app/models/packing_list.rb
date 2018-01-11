class PackingList < ApplicationRecord
  belongs_to :trip
  belongs_to :item
end
