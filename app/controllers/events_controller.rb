class EventsController < ApplicationController

	def index
    @events = Evennt.all
	end

	def show 
		@event = Evennt.find(params[:id]) 
	end

	def new
    @event = Evennt.new
	end

	def edit
  	@event = Evennt.find(params[:id]) 
  end

	def create
		@event = Evennt.new(event_params.except(:email))
    event_params[:email].split(",").each do |e|
			@event.users << User.find_by(email: e)
		end
		if @event.save
  		redirect_to event_path(@event)
	  else
    	render 'new'
    end
	end

	def update
		@event = Evennt.find(params[:id])
      if @event.update(edit_params)
       redirect_to event_path(@event)
	    else
       render 'edit'       
	    end
	end

	def destroy 
 		@event = Evennt.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

private
	def event_params 
    params.require(:event).permit(:eventname,:description,:eventtime,:duration,:email)
  end

  def edit_params 
    params.require(:evennt).permit(:eventname,:description,:eventtime,:duration)
  end
end
