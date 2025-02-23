class AttendedEventsController < ApplicationController
  def create
    @attended_event = AttendedEvent.new(attended_event_params)

    if @attended_event.save
      redirect_to "events/#{params[:attended_event][:event_id]}"
    else
      redirect_to event_show_path, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def attended_event_params
    params.expect(attended_event: %i[event_id user_id])
  end
end
