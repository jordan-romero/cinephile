BASE_URL = "http://www.omdbapi.com/?t="  
API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

class OmdbService 

    def self.search(search)
        @results = HTTParty.get(BASE_URL + "#{search}" + API_PARTIAL_URL)
        @results
    end 
    

end 

