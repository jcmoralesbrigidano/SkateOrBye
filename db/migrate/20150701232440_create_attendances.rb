class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :jam_id
      t.integer :skater_id
      t.string :role
      t.timestamps null: false
    end
  end
end