require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'is valid with valid attributes' do
    player = create(:player)
    expect(player).to be_valid
  end

  it 'is not valid without a name' do
    player = build(:player, name: nil)
    expect(player).not_to be_valid
  end

  it 'is not valid with a non-integer age' do
    player = build(:player, age: "thirty")
    expect(player).not_to be_valid
  end

  it 'is not valid with an age less than or equal to 0' do
    player = build(:player, age: 0)
    expect(player).not_to be_valid
  end

  it 'is not valid with an unsupported gender' do
    player = build(:player, gender: 'unknown')
    expect(player).not_to be_valid
  end

  it 'is valid with gender set to prefer_not_to_say' do
    player = build(:player, gender: 'prefer_not_to_say')
    expect(player).to be_valid
  end
end