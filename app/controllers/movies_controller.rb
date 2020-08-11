class MoviesController < ApplicationController
    before_action :authenticate
    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def index 
        @search = params[:search]
        if @search
            @movie = Movie.find_or_create_from_api(params[:search]) 
        else 
            @movies = Movie.page(params[:page])
        end 
    end 


    def new 
        @movie = Movie.new
        @movie.quotes.build
        
    end 

    def create
        @movie = Movie.find_or_create_from_api(movie_params)
        if @movie.save 
            redirect_to @movie
        else
            @errors = @movie.errors.full_messages
            render "new"
        end
    end

    def edit 
    end 

    def update
        @movie.update(movie_params)
        if @movie.save
            if list = List.find(params[:movie][:list_ids])
                @movie.lists << list
            end 
            flash[:success] = "Movie was successfully added to list."
            redirect_to @movie 
        else 
            @errors = @movie.errors.full_messages
            render 'edit'
        end 
    end 

    

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
        :poster,
        :actors,
        :plot,
        :imdbRating,
        :director, 
        quotes_attributes: [
            :text, 
            :character
        ]
        )
    end 
   

end
