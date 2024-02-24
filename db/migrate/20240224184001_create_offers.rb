class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.int4range :target_range_age
      t.string :target_gender

      t.timestamps
    end
  end
end
