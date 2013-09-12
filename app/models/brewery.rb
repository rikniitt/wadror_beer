class Brewery < ActiveRecord::Base
	attr_accessible :name, :year

	has_many :beers
	has_many :ratings, :through => :beers
	
	include RatingAverage
	
	def to_s
		name
	end
end
