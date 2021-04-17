require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        user = described_class.new(name: 'John')
        expect(user).to be_valid
        user.name = nil
        expect(user).to_not be_valid
      end
    end
  end

  describe 'associations' do
    it 'has many events' do
      user = User.reflect_on_association(:events)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many attended_events' do
      user = User.reflect_on_association(:attended_events)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many attending_events' do
      user = User.reflect_on_association(:attending_events)
      expect(user.macro).to eq(:has_many)
    end
  end
end
