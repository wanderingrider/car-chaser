FactoryBot.define do
  factory :map do
    address {'船橋'}
    latitude {35.6945}
    longitude {139.983}
    association :item
  end
end
