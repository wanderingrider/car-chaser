class Map < ApplicationRecord
  validates :address, presence: true

  belongs_to :location
  

  geocoded_by :address
  after_validation :geocode
end
