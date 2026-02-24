require 'rest-client'
require 'json'
require 'dotenv/load'
require 'uri' # Needed to safely encode the search query

class Estihis
  BASE_URL = 'https://api.themoviedb.org/3'

  def initialize(api_key)
    @api_key = api_key
  end

  def get_top_rated
    url = "#{BASE_URL}/movie/top_rated?api_key=#{@api_key}&language=en-US&page=1"
    fetch_and_display(url, "Top Rated Movies")
  end

  def search_movie(query)
    # Encode the query so spaces and special characters don't break the URL
    safe_query = URI.encode_www_form_component(query)
    url = "#{BASE_URL}/search/movie?api_key=#{@api_key}&language=en-US&query=#{safe_query}&page=1"
    fetch_and_display(url, "Search Results for: '#{query}'")
  end

  private

  # A helper method to keep the code DRY (Don't Repeat Yourself)
  def fetch_and_display(url, header_text)
    begin
      response = RestClient.get(url)
      data = JSON.parse(response.body)
      
      puts "\n--- #{header_text} ---"
      if data['results'].empty?
        puts "No movies found."
      else
        data['results'].take(5).each do |movie|
          # Handle cases where a release date might be missing
          year = movie['release_date'].to_s.empty? ? "Unknown" : movie['release_date'][0..3]
          puts "#{movie['title']} (#{year}) - Rating: #{movie['vote_average']}"
        end
      end
    rescue RestClient::ExceptionWithResponse => e
      puts "Error: #{e.response}"
    end
  end
end

# Usage
API_KEY = ENV['TMDB_API_KEY']

if API_KEY.nil? || API_KEY.empty?
  puts "Error: TMDB_API_KEY is missing. Please check your .env file."
  exit
end

client = Estihis.new(API_KEY)

puts "====================================="
puts "  Welcome to Estihis Movie Search!   "
puts "====================================="

loop do
  print "\nEnter a movie title to search (or type 'exit' to quit): "
  user_input = gets.chomp

  # Stop the loop if the user types 'exit'
  break if user_input.downcase == 'exit'

  # Check if the user just pressed enter without typing anything
  if user_input.strip.empty?
    puts "Please enter a valid movie name."
  else
    client.search_movie(user_input)
  end
end

puts "\nThanks for using Estihis!"