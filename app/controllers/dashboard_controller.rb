class DashboardController < ApplicationController

  def allevents
    @user = current_user
    @states = State.where(user_id:@user.id ,eventstate:"Accepted" )
  end


  def pendinginvite
    @user = current_user
    @states = State.where(user_id:@user.id,eventstate:"Pending")
  end
end
