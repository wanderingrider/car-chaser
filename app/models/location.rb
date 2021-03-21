class Location < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :map
end
