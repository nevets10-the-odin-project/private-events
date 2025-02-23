class User < ApplicationRecord
  has_many :events, inverse_of: 'creator'
  has_many :attended_events, through: :attended_event, foreign_key: 'event_id', class_name: 'Event'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
