class Style < ActiveRecord::Base
	include RatingAverage
	extend TopRated
	
	attr_accessible :name, :description, :beers
	
	has_many :beers
	has_many :ratings, :through => :beers
	
	def to_s
		name
	end
end
