FactoryBot.define do
  factory :post do
    title         {Faker::Lorem.sentence}
    concept       {Faker::Lorem.paragraph}
    association :user
  end
end
