class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'/songs/show'
    end

    get '/songs/new' do
        erb :'/songs/new'
    end

    post '/songs' do
        @new_song = Song.create(name: params[:song_name])
        if Artist.find_by(name: params[:artist_name])
            @new_song.artist = Artist.find_by(name: params[:artist_name])
        else
            @new_song.artist = Artist.create(name: params[:artist_name])
        end
        params[:song][:genres].each {|genre| @new_song.genres << Genre.find(genre)}
        @new_song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@new_song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/song'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.name = params[:song_name]
        if Artist.find_by(name: params[:artist_name])
            @song.artist = Artist.find_by(name: params[:artist_name])
        else
            @song.artist = Artist.create(name: params[:artist_name])
        end
        @song.genres.clear
        params[:song][:genres].each {|genre| @song.genres << Genre.find(genre) }
        @song.save
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end

end