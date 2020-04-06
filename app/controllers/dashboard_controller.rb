class DashboardController < ApplicationController

  def allevents
    @allevents_hash = Hash.new
    @user = current_user

    @created_evennts = Evennt.where(createdby:@user.id)
    @invitedin_events = State.where(user_id:@user.id,eventstate:["Accepted","Rejected"])
   
    @allevents_hash = {"Createdby"=> @created_evennts,"InvitedIn" => @invitedin_events} 
  end


  def pendinginvite
    @user = current_user
    @states = State.where(user_id:current_user.id,eventstate:"Pending")
  end

  def updatestate 
    @state = State.find_by(evennt_id:params[:evennt_id],user_id:params[:user_id])
    if @state.update(eventstate: params[:state])
      redirect_to  dashboard_path
    end
  end
  
end
