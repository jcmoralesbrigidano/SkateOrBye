class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :challenge
      t.integer :challenge_spot
      t.float :score
      t.integer :skater_challenged
      t.timestamps null: false
    end
  end
end