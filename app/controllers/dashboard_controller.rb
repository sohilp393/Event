class DashboardController < ApplicationController

  def allevents
    @user = current_user 
    @evennts = Evennt.where(createdby:@user.id)
  end


  def pendinginvite
    @user = current_user
    @states = State.where(user_id:current_user.id,eventstate:"Pending")
    @evennts = Evennt.all
  end
end
