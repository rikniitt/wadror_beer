class BeermappingAPI

	def self.places_in city
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

	def self.key
		"d5d6747a4fa4ad80ce84cf451f81ef57"
	end
end
