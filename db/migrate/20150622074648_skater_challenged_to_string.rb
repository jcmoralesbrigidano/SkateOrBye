class SkaterChallengedToString < ActiveRecord::Migration
  def change
  	change_column :challenges, :skater_challenged, :string
  end
end