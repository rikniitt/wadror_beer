class PlacesController < ApplicationController
	def index
	end
	
	def search
		api_key = "d5d6747a4fa4ad80ce84cf451f81ef57"
		url = "http://beermapping.com/webservice/loccity/#{api_key}/"
		city = params[:city].gsub(' ', '%20')
		
		response = HTTParty.get "#{url}#{city}"
		
		places = response.parsed_response["bmp_locations"]["location"]
		
		if places.is_a?(Hash) and places['id'].nil?
			redirect_to places_path, :notice => "No places in #{params[:city]}"
		else
			places = [places] if places.is_a?(Hash)
			
			@places = places.inject([]) do | set, location |
				set << Place.new(location)
			end
			
			render :index
		end
	end
end
