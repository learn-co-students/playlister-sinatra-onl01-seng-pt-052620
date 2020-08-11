class Genre < ActiveRecord::Base
    require_relative './concerns/slugger'
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    extend Slugger::ClassMethods
    include Slugger::InstanceMethods
end
