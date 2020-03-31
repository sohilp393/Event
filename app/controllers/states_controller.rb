class StatesController < ApplicationController

  def update 
    @state = State.find_by(evennt_id:params[:evennt_id],user_id:params[:user_id])
    debugger
    if @state.update(eventstate: params[:state])
      redirect_to  users_path
    end
  end

  def adduser 
    @user=User.find_by(email: params[:user][:email])
    @state = State.new
    @state.user_id = @user.id
    @state.evennt_id = params[:evennt_id]
    debugger 
    if @state.save
       redirect_to  users_path 
    else
      redirect_to  users_path
    end
  end


end
