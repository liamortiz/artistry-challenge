class Instrument < ApplicationRecord
  has_many :artist_instruments
  has_many :artist, :through => :artist_instruments
end
