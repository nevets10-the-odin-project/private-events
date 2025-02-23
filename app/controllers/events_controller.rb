class EventsController < ApplicationController
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  def index
  end
end
