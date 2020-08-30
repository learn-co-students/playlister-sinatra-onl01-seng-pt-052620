require 'rack-flash'

class SongsController < ApplicationController

    enable :sessions
    use Rack::Flash
    
    get "/songs" do
    
        @songs = Song.all
        erb :'/songs/index'

    end

    get "/songs/new" do
    
        @genres = Genre.all
        erb :'/songs/new'

    end

    post '/songs' do 
    
        @song = Song.create(params[:song])
    
        if !params["artist"]["name"].empty? && Artist.all.empty?
          @song.artist = Artist.create(params[:artist])
        else
            @song.artist = Artist.find_by(params[:artist])
        end

        if !params['genres'].empty?
            @song.genre_ids = params[:genres]
        end

        @song.save
    

        flash[:message] = "Successfully created song."
    
        redirect "/songs/#{@song.slug}"
        
    end


    get "/songs/:slug" do
        
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'

    end

    get "/songs/:slug/edit" do
        
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'

    end

    patch "/songs/:slug" do
        
        if !params.keys.include?("genres")
            params["genres"] = []
        end
      
        @song = Song.find_by_slug(params[:slug])
    
        @song.update(params["song"])

        if !params["artist"]["name"].empty? 
            @song.artist.update(params[:artist])
        end        

        flash[:message] = "Successfully updated song."

        redirect "/songs/#{@song.slug}"

    end

    
end