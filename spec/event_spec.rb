require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    subject do
      User.create(id: 2, name: 'JohnDoe')
      described_class.new(location: 'A place', date: Date.parse('2021-04-21'), description: 'A birthday',
                          user_id: 2)
    end

    describe 'location' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.location = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'date' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.date = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'description' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.date = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'creator' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.user_id = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'associations' do
    it 'belongs to one creator' do
      event = Event.reflect_on_association(:creator)
      expect(event.macro).to eq(:belongs_to)
    end

    it 'has many attended_events' do
      event = Event.reflect_on_association(:attended_events)
      expect(event.macro).to eq(:has_many)
    end

    it 'has many attendees' do
      event = Event.reflect_on_association(:attendees)
      expect(event.macro).to eq(:has_many)
    end
  end
end
