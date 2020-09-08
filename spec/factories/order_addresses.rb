FactoryBot.define do
  factory :order_address do
    token         { 'tok00000'}
    postal_code   { '111-1111' }
    prefecture_id { '2' }
    city          { '横浜' }
    house_number  { '青山1-1' }
    building_name { '柳ビル101' }
    tell          { '09012345678' }
  end
end
