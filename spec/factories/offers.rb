FactoryBot.define do
  factory :offer do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    target_range_age { 0..100 }
    target_gender { 'all' }
  end
end
