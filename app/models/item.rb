class Item < ApplicationRecord
  with_options presence: true do
    validates :information_name
    validates :description
    validates :image
    validates :theft_day
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :theft_place_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :theft_place

  has_one_attached :image
  belongs_to       :user
end
