require 'rails_helper'

RSpec.describe 'Sign in', type: :feature do
    let(:user) { User.create(name: 'JohnDoe') }
    scenario 'login' do
      visit users_sign_in_url
      fill_in 'name', with: user.name
      click_button 'Sign In'
      sleep(3)
      expect(current_path).to eq("/users/#{user.id}")
    end
  end