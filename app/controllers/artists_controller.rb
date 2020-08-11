class ArtistsController < ApplicationController

    get '/artists' do
        erb :'/artists/show'
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :'/artists/artist'
    end
end
