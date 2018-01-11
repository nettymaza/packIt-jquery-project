class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :packing_list

  validates :name, presence: true
  validates :duration, presence: true
  validates :start_date, presence: true
end
