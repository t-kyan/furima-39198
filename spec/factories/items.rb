FactoryBot.define do
  factory :item do
    association :user

    name                { Faker::Name.name }
    description         { Faker::Lorem.sentence }
    category            { Category.where.not(id: 1).sample || association(:category) }
    item_condition      { ItemCondition.where.not(id: 1).sample || association(:item_condition) }
    shipping_cost       { ShippingCost.where.not(id: 1).sample || association(:shipping_cost) }
    prefecture          { Prefecture.where.not(id: 1).sample || association(:prefecture) }
    shipping_date       { ShippingDate.where.not(id: 1).sample || association(:shipping_date) }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
