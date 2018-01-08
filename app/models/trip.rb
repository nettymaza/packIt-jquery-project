class Trip < ApplicationRecord
  has_one :packing_list
  has_one :user, through: :packing_list
end

# def save
#     self.packing_list = PackingList.new
#     super
# end
