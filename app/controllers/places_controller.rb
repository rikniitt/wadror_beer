class PlacesController < ApplicationController
	def index
	end
	
	def show
		@place = BeermappingAPI.location params[:id]
		#debugger
	end
	
	def search
		@places = BeermappingAPI.places_in params[:city]
		if @places.empty?
			redirect_to places_path, :notice => "No locations in #{params[:city]}"
		else
			render :index
		end
	end
end
