class Beer < ActiveRecord::Base
	attr_accessible :name, :style, :brewery_id

	belongs_to :brewery
	has_many :ratings, :dependent => :destroy
	
	
	def average_rating
		if not ratings.empty?
			ratings.inject(0.0) { |sum, rating| sum + rating.score } / ratings.size
		else
			0.0
		end
	end
	
	def to_s
		"#{name}, #{brewery.name}"
	end
end
