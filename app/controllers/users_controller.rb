class UsersController < ApplicationController

    def index
   		@users = User.all
   	end

	def show 
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		debugger
		@user = User.new(user_params)
		if @user.save
		render 'index'
		else
		render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	   @user = User.find(params[:id])
       debugger
       if @user.update(user_params)
          redirect_to users_path
       else
          render 'edit'
       end
   	end

	def destroy 
   		@user = User.find(params[:id])
    	debugger  
	    @user.destroy
	    redirect_to users_path
   end

private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end