module MoviesHelper

    def date_format(release_date)
        if !release_date.nil?
            release_date.strftime("%m/%d/%Y")
        end 
    end 

    def default_poster(movie)
        if @movie.poster == "N/A"
            asset_path('download.png')
       else
          @movie.poster 
       end
   end
end
