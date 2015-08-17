require 'sinatra'
require 'sinatra/reloader'
get '/' do
  random_number =  rand(100)
  "The SECRET NUMBER IS #{random_number}"
end
