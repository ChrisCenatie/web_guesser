require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(100)
@@count = 5

get '/' do
  guess = params["guess"]
  cheat = params[:cheat]
  message = check_guess(guess)
  count_message = check_count(guess)
  cheat_message = cheat_mode(cheat)
  erb :index, :locals => { :number => @@secret_number,
                           :message => message,
                           :color => @color,
                           :count_message => count_message,
                           :cheat_message => cheat_message
                         }
end

def check_guess(guess)
  if guess.nil?
    @color = '#FFFFFF'
    ""
  elsif guess.to_i > @@secret_number + 5
    @color = '#FF0000'
    "Way too high!"
  elsif guess.to_i > @@secret_number && guess.to_i <= @@secret_number + 5
    @color = "#FF9090"
    "Too high!"
  elsif guess.to_i < @@secret_number - 5
    @color = '#FF0000'
    "Way too low!"
  elsif guess.to_i < @@secret_number && guess.to_i >= @@secret_number - 5
    @color = "#FF9090"
    "Too low!"
  else
    @color = '#00FF00'
    "The SECRET NUMBER is"
  end
end

def check_count(guess)
  if guess.nil?
    ""
  elsif @@count > 1 && guess.to_i != @@secret_number
    @@count = @@count - 1
    "You now have #{@@count} tries left"
  elsif @@count > 0 && guess.to_i == @@secret_number
    @@count = 5
    @@secret_number = rand(100)
    "You've guessed correctly. A new number has been generated."
  elsif @@count == 1 && guess.to_i != @@secret_number
    @@count = 5
    @@secret_number = rand(100)
    "Too many tries! A new number has been generated"
  end
end

def cheat_mode(cheat)
  if cheat == "true"
    "The secret number is #{@@secret_number}"
  else
    ""
  end
end
