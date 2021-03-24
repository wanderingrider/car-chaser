class Map < ApplicationRecord
  belongs_to :item

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
