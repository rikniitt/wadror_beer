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
	    favorite :brewery
	end

	def favorite_style
		favorite :style
	end
	
	def is_admin?
		admin == true
	end
	
	private
		def favorite(category)
			return nil if ratings.empty?
			rating_pairs = rated(category).inject([]) do |pairs, item|
				pairs << [item, rating_average(category, item)]
			end
			rating_pairs.sort_by { |s| s.last }.last.first
		end
		def rating_average(category, item)
			ratings_of_item = ratings.select{ |r|r.beer.send(category)==item }
			return 0 if ratings_of_item.empty?
			ratings_of_item.inject(0.0){ |sum ,r| sum+r.score } / ratings_of_item.count
		end
		def rated category
			ratings.map { |r| r.beer.send(category) }.uniq
		end
	

end
