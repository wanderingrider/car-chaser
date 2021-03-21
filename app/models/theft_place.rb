class TheftPlace < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '自宅駐車場、月極駐車場' },
    { id: 3, name: 'コインパーキング、出先の駐車場' },
    { id: 4, name: '路上駐車中(一時的な)' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
