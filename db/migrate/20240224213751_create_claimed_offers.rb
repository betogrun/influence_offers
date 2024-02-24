class CreateClaimedOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :claimed_offers do |t|
      t.references :player, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
