require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => { :message => message}
end

def check_guess(guess)
  guess = guess.to_i
  if guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess > SECRET_NUMBER && guess <= SECRET_NUMBER + 5
    "Too high!"
  elsif guess < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess < SECRET_NUMBER && guess >= SECRET_NUMBER - 5
    "Way too low!"
  else
    "The SECRET NUMBER is"
  end
end
