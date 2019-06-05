require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :meathod_override, true
  end

  post '/artists' do
    artist = Artist.create(params)
    redirect "/artists/#{artist.id}"
  end

  get "/" do
    @artists = Artist.all
    erb :welcome
  end

  get '/artists/new' do
    erb :new
  end

  get '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    @name = @artist.name
    erb :show
  end


  delete '/artists/:id' do
    @artist = Artist.all.find_by(id: params[:id])
    @artist.destroy
    redirect to "/"
  end


  get '/artists/:id/edit' do
    @artist = Artist.find_by(id: params[:id])
    erb :edit
  end

  patch '/artists/:id' do
    # binding.pry
    @artist = Artist.find_by(id: params[:id])
    @artist.update(params["artist"])
    redirect "/artists/#{@artist.id}"
  end





end
