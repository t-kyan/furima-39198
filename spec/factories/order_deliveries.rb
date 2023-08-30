FactoryBot.define do
  factory :order_delivery do
    association :user
    association :item

    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '東京都' }
    address        { '1-1' }
    building       { '東京ハイツ' }
    phone_number   { '09056781234' }
  end
end
