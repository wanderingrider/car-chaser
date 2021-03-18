class Item < ApplicationRecord
  with_options presence: true do
    validates :information_name
    validates :description
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Prefecture
end
