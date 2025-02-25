class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :attended_events, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attended_events, source: :attendee

  validates :name, presence: true
  validates :location, presence: true
  validates :event_date, presence: true

  scope :upcoming, -> { where('event_date > ?', Date.today) }
  scope :past, -> { where('event_date < ?', Date.today) }
end
