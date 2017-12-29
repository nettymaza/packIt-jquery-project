class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    validates :name, presence: true
    validates :email, uniqueness: true

end
