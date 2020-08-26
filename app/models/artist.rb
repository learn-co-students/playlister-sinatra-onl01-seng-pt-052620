class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs, source: :artist

    
    def self.find_by_slug(slug)
        
        @artist_name = slug.gsub("-"," ").split
        @artist_name.map do |artist|
            artist.capitalize!
        end

        Artist.find_by(name: @artist_name.join(" "))
    
    end

    def slug

        self.name.downcase.gsub(" ","-")

    end


end