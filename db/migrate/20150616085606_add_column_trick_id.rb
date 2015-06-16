class AddColumnTrickId < ActiveRecord::Migration
  def change
  	add_column :ratings, :trick_id, :integer
  end
end
