class AttendedEventsController < ApplicationController
  def create
    @attended_event = AttendedEvent.new(attended_event_params)

    if @attended_event.save
      redirect_to "/events/#{params[:attended_event][:attended_event_id]}"
    else
      redirect_to event_show_path, status: :unprocessable_entity
    end
  end

  def destroy
    @attended_event = AttendedEvent.find(params.expect(:id))
    @attended_event.destroy!

    redirect_back_or_to root_path
  end

  private

  def attended_event_params
    params.expect(attended_event: %i[attended_event_id attendee_id])
  end
end
