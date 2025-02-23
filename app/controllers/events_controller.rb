class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.build_creator(creator_number: current_user[:id])
  end
end
