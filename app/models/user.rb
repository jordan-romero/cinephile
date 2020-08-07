class User < ApplicationRecord
   has_secure_password
   has_one_attached :avatar
   has_many :reviews
   has_many :movies, through: :reviews
   has_many :lists 

   validates :name, presence: true 
   validates :email, presence: true 
   validates :password, :presence => true,
                        :confirmation => true,
                        :length => {:within => 6..40},
                        :on => :update

   scope :most_reviews, -> {joins(:reviews).group("users.id").order("count(reviews.id) DESC").limit(10)}
   #validates :username, presence: true, uniqueness: true
   #validates :email, presence: true, uniqueness: true

   
end  