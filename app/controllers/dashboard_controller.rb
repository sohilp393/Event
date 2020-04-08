class DashboardController < ApplicationController

  def allevents
    @allevents_hash = Hash.new

    @created_evennts =  Evennt.evennt_createdby(current_user.id)
    @invitedin_events = State.acceptedstates(current_user.id,"Accepted")

    @allevents_hash = {"Createdby"=> @created_evennts,"InvitedIn" => @invitedin_events} 
  end


  def pendinginvite
    @user = current_user
    @states = State.pendinginvites(current_user.id)
  end

  def updatestate 
    @state = State.findstates(params[:evennt_id],params[:user_id])
    if @state.update(eventstate: params[:state])
      redirect_to  pendinginvite_path
    end
  end
  
end
