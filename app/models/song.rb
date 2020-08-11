class Song < ActiveRecord::Base
    require_relative './concerns/slugger'
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    extend Slugger::ClassMethods
    include Slugger::InstanceMethods
end
