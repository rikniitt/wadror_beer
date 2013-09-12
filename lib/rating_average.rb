module RatingAverage
	def average_rating
		if not ratings.empty?
			ratings.inject(0.0) { |sum, rating| sum + rating.score } / ratings.size
		else
			0.0
		end
	end
end
