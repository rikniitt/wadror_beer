class Beer < ActiveRecord::Base
	include RatingAverage
	
	attr_accessible :name, :style, :brewery_id, :raters, :style_id

	belongs_to :brewery
	belongs_to :style
	has_many :ratings, :dependent => :destroy
	has_many :raters, :through => :ratings, :source => :user
	
	validates_presence_of :name
	validates_presence_of :style_id

	def to_s
		"#{name}, #{brewery.name}"
	end
end
