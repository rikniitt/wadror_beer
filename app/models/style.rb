class Style < ActiveRecord::Base

	attr_accessible :name, :description, :beers
	
	has_many :beers
	

	def to_s
		name
	end
end
