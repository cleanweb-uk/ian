# require "rubygems"
require "bundler/setup"

require "twitter"
require "sinatra"

HASHTAG = '#cleanweb'

set :haml, {:format => :html5 }

Twitter.configure do |config|
  config.consumer_key = "tF7U6bpRYeNs7FabT6Q"
  config.consumer_secret = "vwuOXObAfjW3icDlMJmnHKip2zltxzYlAwfJRenpB0"
  config.oauth_token = "564431366-VdUDUrHovQWXCIcDfe9VYuWruRBaHXUoa3YP3jM2"
  config.oauth_token_secret = "NwJRCLjeLax3R51hlLjpk57XcEqFQTDWjRVp1o4ZYoE"
end

get '/' do
  haml :index
end

get '/update' do
  results = Twitter.search(HASHTAG, :count => 5, :result_type => "recent").results
  p results.count
  @tweet = results[rand(results.length)]
  haml :tweet
end

get '/stylesheet.css' do
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass :stylesheet
end
