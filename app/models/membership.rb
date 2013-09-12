class Membership < ActiveRecord::Base
	attr_accessible :user_id, :beer_club_id, :user, :beer_club
	
	belongs_to :user
	belongs_to :beer_club
end
