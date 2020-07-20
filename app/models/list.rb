class List < ApplicationRecord
    has_many :movies
    validates :name, presence: true 
    validates :description, presence: true 
    validates :description, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  
end
