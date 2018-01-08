class User < ApplicationRecord
  has_many :packing_lists
  has_many :trips, through: :packing_lists
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
