class GenresController < ApplicationController

    get "/genres" do

        @songs = Song.all
        erb :index

    end

    get "/genres/:slug" do


    end

end