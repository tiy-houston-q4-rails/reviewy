
# require 'json'

class ReviewsController < ApplicationController
  def search
  end

  def results
    connection = BadFruit.new(ENV["ROTTEN_TOMATO_API_KEY"])
    movies = connection.movies.search_by_name(params[:movie_title])
    @movie = movies.first
    @reviews = @movie.reviews
  end

  # def results
  #
  #   movie_title = params[:movie_title]
  #
  #   movies_json = read_json_from_api "/api/public/v1.0/movies.json?apikey=4t6456xa33z8qhcqyuqgnkjh&q=#{movie_title}"
  #   @movie = movies_json['movies'].first || {}
  #   # take id from that
  #   id = @movie["id"]
  #   # search for results
  #   reviews_json = read_json_from_api "api/public/v1.0/movies/#{id}/reviews.json?apikey=4t6456xa33z8qhcqyuqgnkjh"
  #   @reviews = reviews_json["reviews"] || []
  # end
  #
  # private
  #
  # def read_json_from_api(path)
  #   response = connection.get(path)
  #   JSON.parse(response.body)
  # end
  #
  # def connection
  #   Faraday.new("http://api.rottentomatoes.com")
  # end
end
