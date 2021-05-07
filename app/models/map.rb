class Map < ApplicationRecord
  belongs_to :item

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  with_options presence: true do
    validates :address
    validates :latitude
    validates :longitude
  end
end
