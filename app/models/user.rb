class User < ActiveRecord::Base
    has_many :bags
    has_secure_password
end