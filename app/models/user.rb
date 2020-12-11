class User < ActiveRecord::Base
    has_many :bags
    has_secure_password
    validates :name, :username, presence: true
    validates :username, uniqueness: true
end