class User < ApplicationRecord
  has_many :trips
  has_many :packing_lists, through: :trips

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
