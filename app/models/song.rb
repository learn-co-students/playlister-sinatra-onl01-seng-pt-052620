class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres 
    has_many :genres, through: :song_genres


    def self.find_by_slug(slug)
        
        @song_name = slug.gsub("-"," ").split
        @song_name.map do |songs|
            songs.capitalize!
        end

        Song.find_by(name: @song_name.join(" "))


    end

    def slug

        self.name.downcase.gsub(" ","-")

    end

end