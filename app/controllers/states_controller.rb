class StatesController < ApplicationController

  def update 
    @state = State.find_by(evennt_id:params[:evennt_id],user_id:params[:user_id])
    if @state.update(eventstate: params[:state])
      redirect_to  users_path
    end
  end


private

  def email_params 
    params.require(:user).permit(:email)
  end

end
