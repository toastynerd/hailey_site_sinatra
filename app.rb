require 'rubygems'
require 'bundler'
Bundler.require

Tilt.register Tilt::ERBTemplate, 'html.erb'

def herb(template, options = {}, locals={})
  render 'html.erb', template, options, locals
end

get '/' do
  herb :index
end

get '/galleries' do
  herb :galleries
end

get '/gallery/:gallery' do
  @images = Dir.glob("images/#{params[:gallery]}/*.{jpg,jpeg,JPG,JPEG}")
  herb :gallery
end
