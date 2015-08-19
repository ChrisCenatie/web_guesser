require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => { :number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if guess.nil?
    ""
  elsif guess.to_i > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess.to_i > SECRET_NUMBER && guess.to_i <= SECRET_NUMBER + 5
    "Too high!"
  elsif guess.to_i < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess.to_i < SECRET_NUMBER && guess.to_i >= SECRET_NUMBER - 5
    "Too low!"
  else
    "The SECRET NUMBER is"
  end
end
