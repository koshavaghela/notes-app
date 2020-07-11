class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		return redirect_to root_path if logged_in?

		@user = User.new(user_params)

		if User.find_by(email: params[:email])
			flash[:notice] = "User with email #{@user.email} already exists, please log in"
			redirect_to login_path
		end

		if @user.valid? && @user.save
			session[:user_id] = @user.id 
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name)
	end
end
