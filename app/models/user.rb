class User < ApplicationRecord
    require "securerandom"
    has_secure_password
    has_many :users
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :username, presence: true, uniqueness: true
end
