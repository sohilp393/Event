class UsersController < ApplicationController
 
	def show
    @user = User.userdetails(params[:id])
	end

	def edit
		@user = User.userdetails(params[:id])
	end

	def update
	  @user = User.userdetails(params[:id])    
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
 	end

private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end 