class Movie < ApplicationRecord
    
    has_many :movie_lists
    has_many :lists, through: :movie_lists
    
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    validates :title, presence: true 

    scope :ordered_by_title, -> { order(title: :asc) }
   

    def self.ordered_by_title 
        self.order(title: :asc)
    end

    def can_delete?
        self.reviews.empty? && self.lists.empty?
    end

    
    # def reject_reviews(attributes)
    #     attributes['rating', 'content'].blank?
    # end

   
    # def self.search(search)
    #     where("name LIKE ?", "%#{search}%")
    # end 
    
    def self.find_or_create_from_api(search)
        movie = OmdbService.search(search)
        @movie = Movie.find_or_create_by(title: movie["Title"], 
        runtime: movie["Runtime"], 
        genre: movie["Genre"], 
        release_date: movie["Released"],
        poster: movie["Poster"],
        actors: movie["Actors"],
        plot: movie["Plot"],
        imdbRating: movie["imdbRating"],
        director: movie["Director"]) 

    end 

    

    #get the search term from the user
    #pass the input into the search method 
    #create or find an object from the api 
    #return it 

    
end
