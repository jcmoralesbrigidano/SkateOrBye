class CreateTricks < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.string :video
      t.float :average_rating
      t.timestamps null: false
    end
  end
end