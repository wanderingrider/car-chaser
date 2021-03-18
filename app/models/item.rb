class Item < ApplicationRecord
  with_options presence: true do
    validates :information_name
    validates :description
    validates :image
  end


  validates :prefecture_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :theft_place

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Prefecture

end
