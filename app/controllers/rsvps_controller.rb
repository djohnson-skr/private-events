class RsvpsController < ApplicationController
  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      redirect_to events_path
    end
  end

  def destroy
    user_id = current_user.id
    event = Event.find(params[:id])
    event_id = event.id
    # using a finder method to an instance of Rsvp
    # using where would return an activerecord::relation
    @rsvp = Rsvp.find_by(attendee_id: user_id, attended_event_id: event_id)
    @rsvp.destroy

    redirect_to events_path
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:attended_event_id, :attendee_id)
  end

end
