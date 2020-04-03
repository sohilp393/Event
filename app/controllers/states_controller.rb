class StatesController < ApplicationController
 
  def update 
    @state = State.find_by(evennt_id:params[:evennt_id],user_id:params[:user_id])
    if @state.update(eventstate: params[:state])
      redirect_to  dashboard_path
    end
  end

  def adduser 
    @user=User.find_by(email: params[:user][:email])
    @state = State.new
    @state.user_id = @user.id
    @state.evennt_id = params[:user][:evennt_id]
    if @state.save
       redirect_to  dashboard_path 
    else
      redirect_to  dashboard_path
    end
  end
end
