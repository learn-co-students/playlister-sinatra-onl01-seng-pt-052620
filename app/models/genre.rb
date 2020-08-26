class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    
    def self.find_by_slug(slug)

        @genre = slug.gsub("-"," ").split
        @genre.map do |genres|
            genres.capitalize!
        end

        Genre.find_by(name: @genre.join(" "))

    end

    def slug

        self.name.downcase.gsub(" ","-")

    end

end