class AddPasswordDigestColumn < ActiveRecord::Migration
  def change
  	add_column :skaters, :password_digest, :string
  end
end
