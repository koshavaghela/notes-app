class SessionsController < ApplicationController

	def new
	end

	def create
		#user = User.find_by(email: params[:user][:email])&.authenticate(params[:user][:password])

		if user&.authenticate(params[:session][:password]) 
			session[:user_id] = user.id
			flash[:notice] = "Successfully signed in"
			return redirect_to root_path
		else
			redirect_to login_path, alert: "Log in is incorrect"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have been logged out"
		redirect_to login_path
	end

	private

	def user
		@user ||= User.find_by(email: params[:session][:email].downcase)
	end
end
