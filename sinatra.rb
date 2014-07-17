require 'sinatra'
require 'pry'
require 'imdb'

class NewGame
  def initialize()
    @movies = []
  end

  def load(keyword)
    @movies = Imdb::Search.new(keyword).movies.take(9)
  end

  def play()
  end

  def movies()
    @movies
  end

end

get '/' do
  erb :party
end

post '/api/movies' do 
  game = NewGame.new()
  game.load(params[:keyword])
  puts '--------------------'
  @movies = game.movies
  erb :party
end










