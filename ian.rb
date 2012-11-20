require "rubygems"
require "bundler/setup"

require "twitter"
require "sinatra"

HASHTAG = '#CleanClouds'

set :haml, {:format => :html5 }

get '/' do
  haml :index
end

get '/update' do
  @tweet = Twitter::Search.new.q(HASHTAG).fetch.first
  haml :tweet
end

get '/stylesheet.css' do
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass :stylesheet
end
