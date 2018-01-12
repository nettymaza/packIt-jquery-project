class Trip < ApplicationRecord
  belongs_to :user
  has_many :packing_lists
  has_many :items, through: :packing_lists

  validates :name, presence: true
  validates :duration, presence: true
  validates :start_date, presence: true
  accepts_nested_attributes_for :items



  def items_attributes=(item_attributes)
    item_attributes.values.each do |item_attribute|
      new_item = Item.find_or_create_by(item_attribute)
      self.items << new_item
    end
  end
end
