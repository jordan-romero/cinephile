class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:movie_id]
            @movie = Movie.find_by(id: params[:movie_id])
            if @movie.nil?
              redirect_to movies_path, alert: "Movie not found"
            else
              @reviews = @movie.reviews
            end
        else
            @reviews = Review.all
        end
    end 

    def show
        if params[:movie_id]
            @movie = Movie.find_by(id: params[:movie_id])
            @review = @movie.reviews.find_by(id: params[:id])
            if @review.nil?
              redirect_to movie_review_path(@movie), alert: "Movie not found"
            end
        else
            @review = Review.find(params[:id])
        end 
    end
        
     

    def new 
        if params[:movie_id] && !Movie.exists?
            (params[:movie_id])
            redirect_to movies_path, alert: "Movie not Found."
        else 
            @review = Review.new(movie_id: params[:movie_id])
        end 
    end 
    
    def create
        @review = Review.new(review_params)
        @movie = @review.movie
        if @review.save
            redirect_to @movie
        else  
            render 'new'
        end 
    end 

    def edit 
        if params[:movie_id]
            movie = Movie.find_by(id:params[:movie_id])
            if movie.nil? 
                redirect_to movies_path, alert: "Movie not Found."
            else
                @review = movie.reviews.find_by(id: params[:id])
                redirect_to reviews_path, alert: "Review not Found." if @review.nil? 
            end 
        else 
            @review = Review.find(params[:id])
        end 
    end 

    def update          
        @review.update(review_params)
        if @review.save 
            redirect_to @review 
        else 
            render 'edit'
        end 
    end 

    def destroy 
        @review.destroy(review_params)
        redirect_to reviews_path
    end 

    private 

    def set_review
        @review = Review.find(params[:id])
    end 
    
    def review_params
        params.require(:review).permit(:rating, :content, :movie_id, :user_id)
    end 

end