class Membership < ActiveRecord::Base
	attr_accessible :user_id, :beer_club_id, :user, :beer_club, :confirmed
	
	belongs_to :user
	belongs_to :beer_club
	
	scope :active, -> { where(:confirmed => true) }
	scope :pending, -> { where(:confirmed => [nil, false]) }
end
