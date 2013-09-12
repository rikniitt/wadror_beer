class User < ActiveRecord::Base
	include RatingAverage
	
	attr_accessible :username, :beers, :ratings, :memberships, :beer_clubs
	
	has_many :ratings
	has_many :beers, :through => :ratings
	has_many :memberships
	has_many :beer_clubs, :through => :memberships
	
	def to_s
		username
	end
end
