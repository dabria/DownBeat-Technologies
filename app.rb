require 'rubygems'
require 'sinatra/base'
require 'sass'
require 'slim'

class SassEngine < Sinatra::Base
  set :views,   File.dirname(__FILE__)    + '/assets/sass'

  get '/stylesheets/*.css' do
    filename = params[:splat].first
    sass filename.to_sym
  end
end

class DownBeat < Sinatra::Base
  use SassEngine

  set :bind, '0.0.0.0'
  set :views,   File.dirname(__FILE__) + '/views'
  set :public_dir,  File.dirname(__FILE__) + '/public'

  get '/' do
    @page = "home"
    slim :home
  end

  get '/about' do
    @page = "about"
    slim :about
  end

  get '/contact' do
    @page = "contact"
    slim :contact
  end

  get '/media' do
    @page = "media"
    slim :media
  end
end

DownBeat.run!
