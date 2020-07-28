module MoviesHelper

    def date_format(release_date)
         release_date.strftime("%m/%d/%Y")
    end 
end
