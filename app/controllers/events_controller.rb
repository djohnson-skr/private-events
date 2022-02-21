class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:succes] = 'New Event Created!'
      redirect_to events_path
    else
      flash[:error] = "Check your event details"
      render 'new'
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
