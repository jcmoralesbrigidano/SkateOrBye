class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :challenger_id
      t.integer :skater_id
      t.integer :challenge_spot
      t.string :challenge
      t.string :state
      t.timestamps null: false
    end
  end
end