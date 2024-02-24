class Offer < ApplicationRecord
  has_many :claimed_offers
  has_many :players, through: :claimed_offers

  scope :by_demographics, lambda { |gender, age|
    where(
      'target_gender = :gender OR target_gender = \'all\' AND target_range_age @> :age',
       gender: gender, age: age
    )
  }
end
