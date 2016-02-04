require 'httparty'

class Siskel
  attr_accessor :title, :rating, :year, :plot, :response, :consensus

  def initialize(title, options = {})
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{options[:year]}&p=#{options[:plot]}")
    if options[:plot] == :full
      @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{options[:year]}&plot=full")
    end
    @title = @movie['Title']
    if @title == nil
      @title = "Movie not found!"
    end
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
    @response = @movie['Response']
    @consensus = @movie['Metascore'].to_i
    if @consensus >= 76
      @consensus = "Two Thumbs Up"
    elsif @consensus >= 51
      @consensus = "Thumbs Up"
    elsif @consensus >= 26
      @consensus = "Thumbs Down"
    else
      @consensus = "Two Thumbs Down"

    p options[:plot]
    p @movie
  end





  end


end