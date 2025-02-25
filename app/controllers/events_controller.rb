class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.user_id)

    return unless user_signed_in?

    @attended_event = AttendedEvent.new
    @attended_event.build_attended_event(id: @event[:id])
    @attended_event.build_attendee(id: current_user[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.build_creator(id: current_user[:id])

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.expect(event: %i[name location event_date])
  end
end
