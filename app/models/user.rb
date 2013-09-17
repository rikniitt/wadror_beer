class User < ActiveRecord::Base
	include RatingAverage
	
	attr_accessible :username, :beers, :ratings, :memberships, :beer_clubs, :password, :password_confirmation
	
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
	
end
