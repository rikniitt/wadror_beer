class Beer < ActiveRecord::Base
	attr_accessible :name, :style, :brewery_id

	belongs_to :brewery
	has_many :ratings, :dependent => :destroy
	
	include RatingAverage
	
	def to_s
		"#{name}, #{brewery.name}"
	end
end
