class Skater < ActiveRecord::Base
	has_secure_password
	has_many :tricks
end