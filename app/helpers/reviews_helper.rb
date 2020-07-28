module ReviewsHelper
    def stars(num)
        if num
          "⭐️" * num
        else
          "No Reviews Yet!"
        end
      end
end
