FactoryBot.define do
  factory :item do
    name { Faker::Lorem.words(number: 6) }
    price { '2000' }
    description { Faker::Lorem.words(number: 20) }
    category_id { '2' }
    condition_id { '2' }
    shipping_payer_id { '2' }
    shipping_from_area_id { '2' }
    shipping_duration_id { '2' }
    association :user
  end
end
