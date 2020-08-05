class User < ApplicationRecord
   has_secure_password
   has_one_attached :avatar 
   has_many :reviews
   has_many :movies, through: :reviews
   has_many :lists 

   #validates :username, presence: true, uniqueness: true
   #validates :email, presence: true, uniqueness: true

end  