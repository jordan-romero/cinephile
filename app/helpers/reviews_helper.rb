module ReviewsHelper
    def stars(num)
        if num
          "⭐️" * num
        else
          "No Reviews Yet!"
        end
    end


    def date_time_format(created_at)
          created_at.strftime("%b %e, %Y - %l:%M %p")
    end 
    
end
