class OmbdService
    include HTTParty

    BASE_URL: "http://www.omdbapi.com/?"
    API_PARTIAL_URL: "apikey=#{ENV["OMDB_API_KEY"]}"

    # def search(title, param)
    #     results = HTTParty.get(BASE_URL + API_PARTIAL_URL + ("&t=#{title}").to_s)
    #     parsed_results = JSON.parse(results)
    #     parsed_results["#{param}"]
    # end

    # def search(title, param)
    #     results = HTTParty.get("BASE_URL + API_PARTIAL_URL + &t=#{search}").to_s
    #     parsed_results = JSON.parse
    #     parsed_results["#{param}"]
    #   end

   


