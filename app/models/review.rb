class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :rating, :inclusion => 1..10  
  validates :content, presence: true  
  validates :content, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  
end
