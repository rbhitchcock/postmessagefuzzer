# fuzzer.rb
require 'anemone'
require 'sinatra'
require 'haml'
require 'sinatra/json'

set :protection, :except => :frame_options

get '/' do
  haml :index
end

get '/manual' do
  haml :manual
end

get '/sandbox' do
  haml :sandbox
end

post '/spider' do
  url = params['url']
  urls = []
  Anemone.crawl(url) do |spider|
    spider.on_every_page do |page|
      urls.push page.url
    end
  end
  json urls: urls
end

#FIXME store this output
post '/report' do
  location = params['location']
  headers( "Access-Control-Allow-Origin" => "*" )
  json result: location
end
