BASE_URL = "http://www.omdbapi.com/?t="  # using t eliminates the double hash and searches by title but only gives me the first one 
API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

class OmdbService 

    attr_reader :results

    

    def self.search(search)
         
        @results = HTTParty.get(BASE_URL + "#{search}" + API_PARTIAL_URL)
        # response = is what the hash is set equal to when I use t instead of s 
        @results
    end 
    
    # def initialize(query)
    #     @search = "#{query}"
    # end 
  

end 

