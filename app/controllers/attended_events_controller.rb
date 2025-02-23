class AttendedEventsController < ApplicationController
  def create
    @attended_event = AttendedEvent.new(attended_event_params)
    @attended_event.build_attendee(id: current_user[:id])

    if @attended_event.save
      redirect_to event_show_path
    else
      redirect_to event_show_path, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def attended_event_params
    params.expect(attended_event: %i[event_id])
  end
end
