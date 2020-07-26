class Movie < ApplicationRecord
    
    has_many :movie_lists
    has_many :lists, through: :movie_lists
    
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    validates :title, presence: true 
   
    
    # def reject_reviews(attributes)
    #     attributes['rating', 'content'].blank?
    # end

   
    # def self.search(search)
    #     where("name LIKE ?", "%#{search}%")
    # end 
    

    
end
