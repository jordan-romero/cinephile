class Movie < ApplicationRecord
    has_many :quotes 
    has_many :users, through: :quotes 
    accepts_nested_attributes_for :quotes 

    has_many :movie_lists
    has_many :lists, through: :movie_lists
    
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, presence: true 

    scope :ordered_by_title, -> { order(title: :asc) }



    def can_delete?
        self.reviews.empty? && self.lists.empty?
    end

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

    
end
