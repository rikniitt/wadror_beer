class Brewery < ActiveRecord::Base
	include RatingAverage
	
	attr_accessible :name, :year

	has_many :beers
	has_many :ratings, :through => :beers
	
	validates_presence_of :name
	validate :year_not_too_far_in_past_or_future
                                   
                                      
	def year_not_too_far_in_past_or_future
		input_year = Integer(year)
		current_year = Time.now.year
		errors.add(:year, "year must be between 1024-#{current_year}") unless input_year.between?(1024, current_year)
	end
	
	def to_s
		name
	end
end
