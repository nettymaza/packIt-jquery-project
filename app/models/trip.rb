  class Trip < ApplicationRecord
  belongs_to :user
  has_many :packing_lists
  has_many :items, through: :packing_lists, :dependent => :destroy

  validates :name, presence: true
  validates :duration, presence: true
  validates :start_date, presence: true
  accepts_nested_attributes_for :items, reject_if: proc {|attributes| attributes['name'].blank?}, allow_destroy: true

  def items_attributes=(item_attributes)
    item_attributes.values.each do |item_attribute|
      if !item_attribute.empty?
        new_item = Item.find_or_create_by(item_attribute)
        self.items << new_item
      else

      end
    end
  end

end
