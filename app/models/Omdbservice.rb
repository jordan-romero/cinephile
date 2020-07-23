BASE_URL = "http://www.omdbapi.com/?s="  # using t eliminates the double hash and searches by title but only gives me the first one 
API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

class OmdbService 
    

    def self.search(search)
        byebug
       result = HTTParty.get(BASE_URL + "#{search}" + API_PARTIAL_URL).to_s 
       # response = is what the hash is set equal to when I use t instead of s 
       reponse = JSON.parse(result)
       response
    end 
    
    # def initialize(query)
    #     @search = "#{query}"
    # end 
    # def self.search(movie)
    #     search["Search"].each{|movie| movie.create_movie_from_api(movie)}
    # end 

    # def self.create_movie_from_api(search)
        
    #     create(title: search:["Title"]
    #            runtime: search:["Runtime"] )
    # end 

end 

##p.each do |movie| movie.each do |title, value| puts "#{value}" end end 