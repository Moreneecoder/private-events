class Event < ApplicationRecord
  validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true

  scope :past, -> { where('date < ?', Date.current) }
  scope :upcoming, -> { where('date >= ?', Date.current) }

  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :attended_events
  has_many :attendees, foreign_key: :user_id, class_name: 'User', through: :attended_events, source: :user
end
