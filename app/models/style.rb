class Style < ActiveRecord::Base

	attr_accessible :name, :description, :beers
	
	has_many :beers
	
	validates_uniqueness_of :name
	
	
	def to_s
		name
	end
end
