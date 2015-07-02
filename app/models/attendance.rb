class Attendance < ActiveRecord::Base
	belongs_to :jam
	belongs_to :skater
end