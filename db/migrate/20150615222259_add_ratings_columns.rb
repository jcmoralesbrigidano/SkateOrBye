class AddRatingsColumns < ActiveRecord::Migration
  def change
  	add_column :ratings, :rating, :integer
  	add_column :ratings, :skater_id, :integer
  end
end
