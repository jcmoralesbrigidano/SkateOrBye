class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :level
      t.string :floor_quality
      t.string :teachers
      t.string :photo
      t.timestamps null: false
    end
  end
end
