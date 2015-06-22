class CreateJamsSkaters < ActiveRecord::Migration
  def change
    create_table :jams_skaters, id: false do |t|
    	t.belongs_to :jam, index: true
    	t.belongs_to :skater, index: true
    end
  end
end