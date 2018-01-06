class Trip < ApplicationRecord
    belongs_to :user
    # has_one :packing_list
    # has_many :packing_list_item through: :packing_list
    # 
    # def save
    #     self.packing_list = PackingList.new
    #     super
    # end
end
