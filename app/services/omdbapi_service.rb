require 'json'
require 'rest-client'

class OmdbapiService

  def initialize
    @api_key = ENV["OMDB_API"]
    # @title = title
  end

  def call(title)
    response = RestClient.get("https://www.omdbapi.com/?s=#{title}&apikey=#{@api_key}").to_s
    repos = JSON.parse(response)
    repos["Search"].each do |movie|
      Movie.create!(title:  movie["Title"], poster_url: movie["Poster"])
    end
  end
end
