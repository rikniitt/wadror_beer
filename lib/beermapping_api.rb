class BeermappingAPI

	def self.places_in city
		Place # varmistaa, että luokan koodi on ladattu
		city = city.downcase
		Rails.cache.fetch(city, :expires_in => 1.hour) do
			fetch_places_in city
		end
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
		
		def self.key
			Settings.beermapping_apikey
		end
end
