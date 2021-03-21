class Map < ApplicationRecord
  validates :address, presence: true

  belongs_to :item
  belongs_to :user
end
