class SessionsController < ApplicationController
	def new
		# renderöi kirjautumissivun
	end

	def create
		# haetaan usernamea vastaava käyttäjä tietokannasta
		user = User.where(:username => params[:username]).first
		
		if user.nil? or not user.authenticate params[:password]
			redirect_to :back, :notice => "Username and password does not match!"
		else
			# talletetaan sessioon kirjautuneen käyttäjän id (jos käyttäjä on olemassa)
			session[:user_id] = user.id
			redirect_to user_path(user), :notice => "Welcome back!"
		end
	end

	def destroy
		# nollataan sessio
		# session[:user_id] = nil
		# tyhjennä koko sessio, niin edelliset ratingit häviää myös
		reset_session
		# uudelleenohjataan sovellus pääsivulle 
		redirect_to :root
	end
end
