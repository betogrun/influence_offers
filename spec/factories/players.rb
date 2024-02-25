FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    age { 20 }
    gender { 'male' }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
