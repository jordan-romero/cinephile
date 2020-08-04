class ListsController < ApplicationController
    before_action :authenticate
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    

    def index
        @lists = current_user.lists.all
    end 

    def show 
        authorize(@list)
    end 

    def new 
        @list = List.new
    end 

    def create
        @list = current_user.lists.new(list_params)
        if @list.save
            redirect_to @list
        else 
            render 'new'
        end 
    end 

    def edit 
        authorize(@list)
    end 

    def update
        authorize(@list)
        @list.update(list_params)
        if @list.save
            redirect_to @list 
        else 
            render 'edit'
        end 
    end 

    def destroy 
        if @list.destroy
            @movie = @list.movies
            redirect_to lists_path
        else 
            render 'edit'
        end 
    end 

    private 

    def set_list
        @list = List.find(params[:id])
    end 
    
    def list_params
        params.require(:list).permit(:name, :description, :movie_ids => [])
    end 
end
