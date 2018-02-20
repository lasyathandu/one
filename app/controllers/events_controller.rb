class EventsController < ApplicationController
	def index
		@events = Event.all
	end
	def new
		@event = Event.new
	end
	def show
    @event = Event.find(params[:id])
  end
	
  def create
		@event = Event.new(event_params)
		respond_to do |format|
		if @event.save
		format.html {redirect_to events_path,:notice => "event was successfully created"}
    else
		format.html {render action => "new"}
    end
    end   
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])  
    if @event.update_attributes(event_params)
    flash[:notice] = "Event updated successfuly"
    redirect_to(events_path(@event))
    else          
    render('edit')
    end 
  end

  def delete
    @event = Event.find(params[:id])

  end

  def destroy
    @event = Event.find(params[:id])     
    @event.destroy
    flash[:notice] = "Event '#{Event.name}' destroy successfuly"
    redirect_to(events_path)

  end


	private
	def event_params
    params.require(:event).permit!
	end
end
