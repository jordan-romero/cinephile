BASE_URL = "http://www.omdbapi.com/?s="  # using t eliminates the double hash and searches by title but only gives me the first one 
API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

class OmdbService 

#     require "uri"
# require "net/http"

# url = URI("http://www.omdbapi.com/?s=highlander&apikey=508d252f")

# http = Net::HTTP.new(url.host, url.port);
# request = Net::HTTP::Get.new(url)
# request["Cookie"] = "__cfduid=db587ce483169e7e88f4523cb6b61aad61594653560"

# response = http.request(request)
# puts response.read_body
    

     def self.search(search)
         
        result = HTTParty.get(BASE_URL + "#{search}" + API_PARTIAL_URL).to_s 
        # response = is what the hash is set equal to when I use t instead of s 
        response = JSON.parse(result)
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