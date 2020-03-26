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
		
		@event = Evennt.new(event_params.except(:username))
		#@event.user = current_user	
		@event.users << User.find_by(username: event_params[:username])
        debugger
		if @event.save
      		redirect_to event_path(@event)
	    else
	    	render 'new'
	    end
	end

	def update
		debugger
		@event_org = Evennt.find(params[:id])
	    if @event.update(event_params)
	       redirect_to event_path(@event)
	    else
	       render 'edit'       
	    end
	end

	def destroy 
   		@event = Evennt.find(params[:id])
    	debugger
	    @event.destroy
	    redirect_to events_path
   end

private
	def event_params 
     params.require(:event).permit(:eventname,:description,:eventtime,:duration,:username)
   end
end
