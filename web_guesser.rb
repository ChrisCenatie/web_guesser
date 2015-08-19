require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => { :number => SECRET_NUMBER,
                           :message => message,
                           :color => @color}
end

def check_guess(guess)
  if guess.nil?
    @color = '#FFFFFF'
    ""
  elsif guess.to_i > SECRET_NUMBER + 5
    @color = '#FF0000'
    "Way too high!"
  elsif guess.to_i > SECRET_NUMBER && guess.to_i <= SECRET_NUMBER + 5
    @color = "#FF9090"
    "Too high!"
  elsif guess.to_i < SECRET_NUMBER - 5
    @color = '#FF0000'
    "Way too low!"
  elsif guess.to_i < SECRET_NUMBER && guess.to_i >= SECRET_NUMBER - 5
    @color = "#FF9090"
    "Too low!"
  else
    @color = '#00FF00'
    "The SECRET NUMBER is"
  end
end
