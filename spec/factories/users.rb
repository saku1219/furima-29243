FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    # email { "TEst123@gmail.com"}
    password { 'TESTtest1234' }
    password_confirmation {password}
    family_name { '山田' }
    first_name { '太郎' }
    family_name_reading { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birthday {Faker::Date.birthday}
  end
end