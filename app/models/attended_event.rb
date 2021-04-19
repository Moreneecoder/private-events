class AttendedEvent < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  belongs_to :event
end
