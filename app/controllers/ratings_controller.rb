class RatingsController < ApplicationController

	before_filter :ensure_that_signed_in, :except => [:index]
	
	def index
		@ratings = Rating.all(:include => :beer)
		
		@top_beers = Beer.top 3
		@top_breweries = Brewery.top 3
		@top_styles = Style.top 3
		
		@most_active = User.most_active 3
		
		@recent_ratings = Rating.recent
	end
	
	def new
		@rating = Rating.new
		@beers = Beer.all
	end
	
	def create
		@rating = Rating.new params[:rating]
		
		# talletetaan tehty reittaus sessioon  
		#session[:last_rating] = "#{Beer.find(params[:rating][:beer_id])} #{params[:rating][:score]} points"
		
		if @rating.save
			current_user.ratings << @rating
			redirect_to user_path current_user
		else
			@beers = Beer.all
			render :new
		end
	end
	
	def destroy
		rating = Rating.find params[:id]
		rating.delete if current_user == rating.user
		redirect_to :back
	end
	
end

