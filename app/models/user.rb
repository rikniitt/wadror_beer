class User < ActiveRecord::Base
	include RatingAverage
	
	attr_accessible :username, :beers, :ratings, :memberships, :beer_clubs, :password, :password_confirmation, :admin
	
	has_secure_password
	
	has_many :ratings, :dependent => :destroy
	has_many :beers, :through => :ratings
	has_many :memberships, :dependent => :destroy
	has_many :beer_clubs, :through => :memberships
	
	validates_uniqueness_of :username
	validates_length_of :username, :in => 3..15
	validates_format_of :username, :with => /\A.*[^A-z]+.*\Z/, :message => "can't be all alpha"
	validates_length_of :password, :minimum => 4
	
	def to_s
		username
	end
	
	def favorite_beer
		return nil if ratings.empty?
		ratings.sort_by{ |r| r.score }.last.beer
	end
	
	def favorite_brewery
	    return nil if ratings.empty?
		brewery_rating_pairs = rated_breweries.inject([]) do |pairs, brewery|
			pairs << [brewery, brewery_rating_average(brewery)]
		end
		brewery_rating_pairs.sort_by { |s| s.last }.last.first
	end
	def rated_breweries
		ratings.map{ |r|r.beer.brewery }.uniq
	end
	def brewery_rating_average(brewery)
		ratings_of_brewery = ratings.select{ |r|r.beer.brewery==brewery }
		return 0 if ratings_of_brewery.empty?
		ratings_of_brewery.inject(0.0){ |sum ,r| sum+r.score } / ratings_of_brewery.count
	end
	
	def favorite_style
		return nil if ratings.empty?
		style_rating_pairs = rated_styles.inject([]) do |pairs, style|
			pairs << [style, style_rating_average(style)]
		end
		style_rating_pairs.sort_by { |s| s.last }.last.first
	end
	def rated_styles
		ratings.map{ |r|r.beer.style }.uniq
	end
	def style_rating_average(style)
		ratings_of_style = ratings.select{ |r| r.beer.style==style }
		return 0 if ratings_of_style.empty?
		ratings_of_style .inject(0.0){ |sum ,r| sum+r.score } / ratings_of_style.count
	end
	
	
	def is_admin?
		admin == true
	end
end
