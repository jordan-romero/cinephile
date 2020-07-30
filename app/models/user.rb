class User < ApplicationRecord
   has_secure_password
   has_many :reviews
   has_many :movies, through: :reviews
   has_many :lists 

   validates :username, presence: true, uniqueness: true
   validates :email, presence: true, uniqueness: true

   def self.from_omniauth(auth)
      # Creates a new user only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |user|
        user.name = auth.info.name
        user.email = auth.info.email
      end
    end
end
