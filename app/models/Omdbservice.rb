BASE_URL = "http://www.omdbapi.com/?s="
API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

class OmdbService 
    

    def self.search
       result = HTTParty.get(BASE_URL + @search + API_PARTIAL_URL)
    end 
    
    def initialize(query)
        @search = "#{query}"
    end 

end 