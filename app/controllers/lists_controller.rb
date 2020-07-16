class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index
        @lists = List.all 
    end 

    def show 
    end 

    def new 
        @list = List.new
    end 

    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to @list
        else 
            render 'new'
        end 
    end 

    def edit 
    end 

    def update
        @list.update(list_params)
        if @list.save
            redirect_to @list 
        else 
            render 'edit'
        end 
    end 

    def destroy 
        if @list.destroy
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
        params.require(:list).permit(:name, :description)
    end 
end