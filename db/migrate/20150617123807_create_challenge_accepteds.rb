class CreateChallengeAccepteds < ActiveRecord::Migration
  def change
    create_table :challenge_accepteds do |t|
      t.integer :skater_id
      t.integer :challenge_id
      t.string :state
      t.timestamps null: false
    end
  end
end
