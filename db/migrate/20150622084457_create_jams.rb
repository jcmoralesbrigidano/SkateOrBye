class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|
      t.integer :spot_id
	  t.date :date
	  t.time :time
	  t.string :info
      t.timestamps null: false
    end
  end
end