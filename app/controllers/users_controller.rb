class UsersController < ApplicationController
  has_many :events, inverse_of: 'creator'

  def show
  end
end
