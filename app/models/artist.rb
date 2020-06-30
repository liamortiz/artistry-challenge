class Artist < ApplicationRecord
  has_many :artist_instruments
  has_many :instruments, :through => :artist_instruments

  validates :name, :presence => true
  validates :title, :uniqueness => true
  validates :age, :numericality => true

  # Makes sure we don't have duplcate intruments
  def add_instrument(instrument)
    unless self.instruments.include?(instrument)
      self.instruments << instrument
    end
  end
end
