class List < ApplicationRecord
    has_many :movie_lists
    has_many :movies, through: :movie_lists, dependent: :destroy
    belongs_to :user
 
    
    validates :name, presence: true
    validates :name, uniqueness: { scope: :user, message: ": You already have a list by that name!" }
    validates :description, presence: true 
    validates :description, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
   

end
