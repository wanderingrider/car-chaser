FactoryBot.define do
  factory :item do
    information_name    { '野菜' }
    description         { 'おいしい' }
    prefecture_id       { 2 }
    theft_place_id      { 2 }
    theft_day           { '2021-12-31' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
