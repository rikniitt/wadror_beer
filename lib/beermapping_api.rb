class BeermappingAPI

	def self.places_in city
		Place # varmistaa, että luokan koodi on ladattu
		city = city.downcase
		Rails.cache.fetch(city, :expires_in => 1.hour) do
			fetch_places_in city
		end
	end
	
	
	def self.location id
		
		location = place(id)
		location.add_score(ratings(id))

		location
	end
	
	
	def self.place id
		url = "http://beermapping.com/webservice/locquery/#{key}/"
		response = HTTParty.get "#{url}#{id}"
		
		place = response.parsed_response["bmp_locations"]["location"]
		
		if place.is_a?(Hash) and place['id'].nil?
			[]
		else
			Place.new(place)
		end
	end
	
	
	def self.ratings place_id
		url = "http://beermapping.com/webservice/locscore/#{key}/"
		response = HTTParty.get "#{url}#{place_id}"
		
		ratings = response.parsed_response["bmp_locations"]["location"]
		
		if ratings.is_a?(Hash)
			ratings
		else
			{}
		end
	end
			
	def self.key
		key = Settings.all[:beermapping_apikey]
		raise "BeerMappingAPI key is not set!" unless key
		key
	end
	
	private
		def self.fetch_places_in city
			url = "http://beermapping.com/webservice/loccity/#{key}/"
			location = city.gsub(' ', '%20')

			response = HTTParty.get "#{url}#{location}"
			
			places = response.parsed_response["bmp_locations"]["location"]

			return [] if places.is_a?(Hash) and places['id'].nil?

			places = [places] if places.is_a?(Hash)
			return places.inject([]) do | set, place |
				set << Place.new(place)
			end
		end

end
