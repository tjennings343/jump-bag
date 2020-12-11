class Bag < ActiveRecord::Base
    belongs_to :user
    validates :bag_name, :bag_contents, presence: true
end