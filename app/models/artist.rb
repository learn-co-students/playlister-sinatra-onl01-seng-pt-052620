class Artist < ActiveRecord::Base
    require_relative './concerns/slugger'
    has_many :songs
    has_many :genres, through: :songs
    extend Slugger::ClassMethods
    include Slugger::InstanceMethods
end
