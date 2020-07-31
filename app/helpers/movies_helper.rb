module MoviesHelper

    def date_format(release_date)
        if !@release_date.nil?
         release_date.strftime("%m/%d/%Y")
        end 
    end 

    def default_poster(movie)
        if @movie.poster.nil?
          return 'assets/images/default.png'
       else
          @movie.poster 
       end
   end
end
