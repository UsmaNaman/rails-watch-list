# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



require 'open-uri'
require 'json'
# require "rest-client"
# require 'pp'


puts "Cleaning up database..."
Review.destroy_all
Bookmark.destroy_all
Movie.destroy_all
puts "Database cleaned"

# response = RestClient.get "https://www.omdbapi.com/?s=Batman&apikey=#{ENV["OMDB_API"]}"
# repos = JSON.parse(response)

# omdbapi_service = OmdbapiService.new
# repos = omdbapi_service.call('superman')
# => repos is an `Array` of `Hashes`.

# pp repos


# title = hash["Search"][0]["Title"]

# url = "http://tmdb.lewagon.com/movie/top_rated"
# 10.times do |i|
#   puts "Importing movies from page #{i + 1}"
#   movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
#   movies.each do |movie|
#     puts "Creating #{movie['title']}"
#     base_poster_url = "https://image.tmdb.org/t/p/original"
#     Movie.create(
#       title: movie['title'],
#       overview: movie['overview'],
#       poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
#       rating: movie['vote_average']
#     )
#   end
# end
# puts "Movies created"

# puts 'Cleaning up database...'
# Movie.destroy_all
# puts 'Database cleaned'

puts "Wiping movies..."
puts "Creating movies."

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

puts "Movies compiled"

puts "Creating top-rated movies"

url = 'http://tmdb.lewagon.com/movie/top_rated'

puts 'Importing movies'
movies = JSON.parse(URI.open("#{url}?page=1").read)['results']
movies.each do |movie|
  puts "Creating #{movie['title']}"
  base_poster_url = 'https://image.tmdb.org/t/p/original'
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
    rating: movie['vote_average']
  )
end

puts 'Movies created'
