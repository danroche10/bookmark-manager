require_relative './lib/bookmarks'
require 'sinatra/base'
require 'sinatra/reloader'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks' do
    Bookmarks.add(params[:url])
    @bookmarks = Bookmarks.all
    redirect(:bookmarks)
  end

  get '/add_bookmark' do
    erb(:add_bookmarks)
  end
  
  run! if app_file == $0

end