class CreateSkaterChallenges < ActiveRecord::Migration
  def change
    create_table :skater_challenges do |t|
      t.integer :skater_id
      t.integer :challenge_id
      t.string :state
      t.timestamps null: false
    end
  end
end
