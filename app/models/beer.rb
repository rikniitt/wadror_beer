class Beer < ActiveRecord::Base
	attr_accessible :name, :style, :brewery_id

	belongs_to :brewery
end
