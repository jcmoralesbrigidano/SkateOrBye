class CreateTricks < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.string :video
      t.integer :rating
      t.timestamps null: false
    end
  end
end