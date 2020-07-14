class Movie < ApplicationRecord
    validates :title, presence: true 
    belongs_to :list
    
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
