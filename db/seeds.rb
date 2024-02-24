# Generate Offers

age_groups = [ 0..100, 0..12, 13..18, 19..25, 26..40, 41..60, 61..100, 0..18, 19..100 ]
genders = %w(male female all)

100.times do
  Offer.create!(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    target_gender: genders.sample,
    target_range_age: age_groups.sample
  )
end
