class OmdbService < ApplicationRecord
    include Httparty

    BASE_URL = "http://www.omdbapi.com/"
    API_PARTIAL_URL = "&apikey=#{ENV['OMDB_API_KEY']}" 

    def search
       result = Httparty.get(BASE_URL + @search + API_PARTIAL_URL).to_json
       @request_hash = JSON.parse(request)
    end 
    
    def initialize(query)
        @search = "?s=#{query}"
    end 

end 