require 'rubygems'
require 'sinatra/base'
require 'sass'
require 'slim'

class SassEngine < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/assets/sass'

  get '/stylesheets/*.css' do
    filename = params[:splat].first
    sass filename.to_sym
  end
end

class CoffeeEngine < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/assets/coffeescript'

  get '/js/*.js' do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end

class DownBeat < Sinatra::Base
  use SassEngine
  use CoffeeEngine

  set :bind, '0.0.0.0'
  set :views, File.dirname(__FILE__) + '/views'
  set :public_dir, File.dirname(__FILE__) + '/public'

  before do
    @navbar = slim :navbar, layout: false
  end

  get '/' do
    @page = "home"
    slim :home
  end

  get '/about' do
    @page = "about"
    slim :about
  end

  get '/beatmachine' do
    @page = "beatmachine"
    slim :beatmachine
  end

  get '/contact' do
    @page = "contact"
    slim :contact
  end

  get '/media' do
    @page = "media"
    slim :media
  end

  get '/team' do
    @page = "team"
  end


end

DownBeat.run!
