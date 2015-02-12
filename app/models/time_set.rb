class TimeSet < ActiveRecord::Base
	belongs_to :affair

	def self.today
		where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day))
	end
end
