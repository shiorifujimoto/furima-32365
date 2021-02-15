FactoryBot.define do
  factory :item do
    association :user

    title {"料理の本"}
    description {Faker::Lorem.sentence}
    price {Faker::Number::within(range: 300..9999999)}
    category_id {Faker::Number::within(range: 2..10)}
    status_id {Faker::Number::within(range: 2..7)}
    shopping_cost_id {Faker::Number::within(range: 2..3)}
    prefecture_id {Faker::Number::within(range: 2..48)}
    shopping_day_id {Faker::Number::within(range: 2..4)}

    after(:build) do |item|
      item.image.attach(io:File.open('public/images/test_image.png'),filename:'test_image.png')
    end
  end
end
