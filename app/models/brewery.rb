class Brewery < ActiveRecord::Base
	attr_accessible :name, :year

	has_many :beers
	has_many :ratings, :through => :beers
	
	def average_rating
		if not ratings.empty?
			ratings.inject(0.0) { |sum, rating| sum + rating.score } / ratings.size
		else
			0.0
		end
	end
	
	def to_s
		name
	end
end
