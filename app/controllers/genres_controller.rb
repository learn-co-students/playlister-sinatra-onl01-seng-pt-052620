class GenresController < ApplicationController

    get '/genres' do
        erb :'/genres/show'
    end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        erb :'/genres/genre'
    end

end
