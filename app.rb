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
    Bookmarks.add(params[:url], params[:title])
    @bookmarks = Bookmarks.all
    redirect(:bookmarks)
  end

  get '/add_bookmark' do
    erb(:add_bookmarks)
  end

  enable :sessions, :method_override

  delete '/bookmarks/:id' do
    p params
    Bookmarks.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmarks.find(params[:id])
    @bookmark_id = @bookmark.id
    erb :edit
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end
  
  run! if app_file == $0

end