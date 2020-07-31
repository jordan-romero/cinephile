class List < ApplicationRecord
    has_many :movie_lists
    has_many :movies, through: :movie_lists, dependent: :destroy
    belongs_to :user
    
    validates :name, presence: true 
    validates :description, presence: true 
    validates :description, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
   


    # def already_added? 
    #     if self.movie_id.present?
    #         flash[:notice] = "You already added that to this list!"
    #     else     
    #         if self.find(params[:list][:movie_ids])
    #             @list.movies << movie 
    #         end 
    #     end 
    # end 
  
end
