class CreateSkaters < ActiveRecord::Migration
  def change
    create_table :skaters do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps null: false
    end
  end
end
