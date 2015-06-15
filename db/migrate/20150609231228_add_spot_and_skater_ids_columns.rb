class AddSpotAndSkaterIdsColumns < ActiveRecord::Migration
  def change
  	add_column :tricks, :spot_id, :integer
  	add_column :tricks, :skater_id, :integer
  end
end
