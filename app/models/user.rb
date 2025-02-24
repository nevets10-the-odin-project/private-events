class User < ApplicationRecord
  has_many :events, inverse_of: 'creator'
  has_many :attended_event, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attended_event, source: :attended_event

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
