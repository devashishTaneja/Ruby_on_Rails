class SessionsController < ApplicationController
  def new
  end
  
  def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			remember user
			log_in user
			redirect_to profile_url
		else
			flash[:danger] = 'Invalid email/password combination' 
			render 'new'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end

	def show
		@user = current_user
		@micropost = current_user.microposts.paginate(page: params[:page])
	end

	def edit
		@user = current_user
	end

end
