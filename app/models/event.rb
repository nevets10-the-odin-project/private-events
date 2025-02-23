class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  validates :name, presence: true
  validates :location, presence: true
  validates :event_date, presence: true
end
