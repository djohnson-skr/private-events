class RsvpsController < ApplicationController
  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      redirect_to events_path
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:attended_event_id, :attendee_id)
  end

end
