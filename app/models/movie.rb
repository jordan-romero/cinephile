class Movie < ApplicationRecord
    validates :title, presence: true 
    belongs_to :list
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews#, reject_if: proc { |attributes| (attributes['rating'].blank? && attributes['content'].blank?)}
    accepts_nested_attributes_for :reviews
    
    # def reject_reviews(attributes)
    #     attributes['rating', 'content'].blank?
    # end

    def list_name=(name)
        self.list = List.find_by(name: name)
    end
    
    def list_name
        self.list ? self.list.name : nil
    end

    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end 
end
