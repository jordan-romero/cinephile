BASE_URL = "http://www.omdbapi.com/?s="  # using t eliminates the double hash and searches by title but only gives me the first one 
API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

class OmdbService 
    

    def self.search(search)
       result = HTTParty.get(BASE_URL + "#{search}" + API_PARTIAL_URL).to_s 
       # parsed_response = is what the hash is set equal to when I use t instead of s 
       parsed_response = JSON.parse(result)
       parsed_response
    end 
    
    # def initialize(query)
    #     @search = "#{query}"
    # end 

end 