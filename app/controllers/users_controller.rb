class UsersController < ApplicationController
		
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	# render params.inspect
	
  	if @user.save
  		redirect_to users_path, notice: 'New user created.'	
  	else
  		# redirect_to new_user_path, alert: 'There is an error on creating user'
  		render :new
  	end
  
  end
  
  private
  
  # def set_user
  # 	@user = User.find(params[:id])
  # end

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end

end
