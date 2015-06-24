class CreateTricks < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.integer :skater_id
      t.integer :spot_id
      t.string :video
      t.float :average_rating
      t.integer :challenge_id
      t.timestamps null: false
    end
  end
end