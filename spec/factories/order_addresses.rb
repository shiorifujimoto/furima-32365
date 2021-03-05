FactoryBot.define do
  factory :order_address do

    Faker::Config.locale = :ja

    token         { 'aaabbbccc111222' }

    postal_code   { Faker::Address::postcode }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city          { Faker::Address.city }
    block         { Faker::Address.street_address }
    build         { 'やすらぎ壮101号室' }
    phone_number  { Faker::Number.number(digits: 11) }
  end
end
