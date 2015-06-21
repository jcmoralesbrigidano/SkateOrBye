class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :trick_id
      t.integer :skater_id
      t.integer :rating
      t.timestamps null: false
    end
  end
end