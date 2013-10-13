class BeerClub < ActiveRecord::Base
	attr_accessible :name, :founded, :city, :memberships, :members
	
	has_many :memberships
	has_many :members, :through => :memberships, :source => :user
	
	def members
		memberships.active.collect{ |m| m.user }
	end
	
	def already_member?(user)
		members.include? user
	end
	
	def to_s
		name
	end
end
