require 'rails_helper'

RSpec.describe AttendedEvent, type: :model do
  describe 'associations' do
    it 'belongs to creator' do
      event = AttendedEvent.reflect_on_association(:user)
      expect(event.macro).to eq(:belongs_to)
    end

    it 'has many attended_events' do
      event = AttendedEvent.reflect_on_association(:event)
      expect(event.macro).to eq(:belongs_to)
    end
  end
end
