class List < ApplicationRecord
    has_many :movie_lists
    has_many :movies, through: :movie_lists
    belongs_to :user
    
    validates :name, presence: true 
    validates :description, presence: true 
    validates :description, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  
end
