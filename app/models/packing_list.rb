class PackingList < ApplicationRecord
    belongs_to :trip
    # has_many :packing_list_item
end
