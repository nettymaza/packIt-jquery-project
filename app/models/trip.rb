class Trip < ApplicationRecord
  belongs_to :user
  has_many :packing_lists
  has_many :items, through: :packing_lists

  validates :name, presence: true
  validates :duration, presence: true
  validates :start_date, presence: true


  def item=(item)
    item.each do |list_item|
      if !list_item[:name].empty?
        if new_list_item = Item.find_by(name: list_item[:name])
          self.list_item << new_item
        else
          self.list_item.build(name: list_item[:name])
        end
      end
    end
  end


end
