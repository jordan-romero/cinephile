class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def index 
        @api_movie = OmdbService.search(params[:search])
        @movies = Movie.all 
    end 


    def new 
        @movie = Movie.new
        
    end 

    def create 
        @movie = Movie.new(movie_params)  
        if @movie.save
            redirect_to @movie
        else
            render "new"
        end
    end

    def edit 
    end 

    def update
        @movie.update(movie_params)
        if @movie.save
            redirect_to @movie 
        else 
            render 'edit'
        end 
    end 

        ## need to create a movie from content from OMDB so is this a POST request using HTTParty? Should I use URI?
        ## They will then use that data to pop lists unwatched watched 
        ## they will have full CRUD on reviews but I want to be able to pull images etc eventually from the API
  

    def show 
    end 

    def destroy 
        if @movie.destroy
            redirect_to movies_path
        else 
            render 'edit'
        end 
    end 


    private 

    def set_movie
        @movie = Movie.find(params[:id])
    end 

    def movie_params
        params.require(:movie).permit(:title, 
        :release_date, 
        :genre,
        :runtime, 
        :list_name)
    end 
   

end
