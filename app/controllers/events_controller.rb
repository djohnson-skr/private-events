class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
    @past_events = Event.past_events
    @upcoming_events = Event.upcoming_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:succes] = 'New Event Created!'
      redirect_to @event
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
