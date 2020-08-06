class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :rating, inclusion: {in: (1..10), message: "should be between 1 and 10."}
  validates :content, presence: true  
  validates :content, length: { maximum: 250, too_long: "%{count} characters is the maximum allowed" }

  scope :recent, ->(num) { order('created_at DESC').limit(num) }

  # def recent
  #   self.order(created_at: :desc)
  # end 
  
end
