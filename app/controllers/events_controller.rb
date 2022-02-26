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
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
