class Affair < ActiveRecord::Base
	belongs_to :category
	has_many :time_sets
end
