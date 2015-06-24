class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :skater_challenged
      t.integer :challenge_spot
      t.string :challenge      
      t.float :score      
      t.string :state
      t.timestamps null: false
    end
  end
end