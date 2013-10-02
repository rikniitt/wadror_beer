class Place
	attr_accessor :id, :name, :status, :reviewlink, :proxylink, :blogmap, :street, :city, :state, :zip, :country, :phone, :overall, :imagecount, :selection, :service, :atmosphere, :food, :reviewcount, :fbscore, :fbcount

	def self.rendered_fields
		[:id, :name, :status, :street, :city, :zip, :country, :overall ]
	end
	
	def initialize(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end
	
	
	def self.score_rendered_fields
		[:overall, :selection, :service, :atmosphere, :food, :reviewcount, :fbscore, :fbcount]
	end
	
	
	def add_score(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end
end
