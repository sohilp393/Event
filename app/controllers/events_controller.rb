class EventsController < ApplicationController

	def index
	    @events = EventOrg.all
	end

	def show 
		@event = EventOrg.find(params[:id]) 
	end

	def new
	    @event = EventOrg.new
	end

	def edit
    	@event = EventOrg.find(params[:id]) 
  	end

	def create
		debugger
		@event = EventOrg.new(event_params)
		@event.user = current_user
		#@event.user = User.last
		if @event.save
      		redirect_to event_path(@event)
	    else
	    	render 'new'
	    end
	end

	def update
		debugger
		@event_org = EventOrg.find(params[:id])
	    if @event.update(event_params)
	       redirect_to event_path(@event)
	    else
	       render 'edit'       
	    end
	end

	def destroy 
   		@event = EventOrg.find(params[:id])
    	debugger
	    @event.destroy
	    redirect_to events_path
  
   end

private
	def event_params 
     params.require(:event).permit(:eventname,:description,:event_time,:duration)
   end
end
