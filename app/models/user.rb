class User < ApplicationRecord
  validates :name, presence: :true
  
  has_many :events
  has_many :attended_events
  has_many :attending_events, foreign_key: :event_id, class_name: 'Event', through: :attended_events, source: :event
end
