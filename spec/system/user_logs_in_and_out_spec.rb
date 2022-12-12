# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User logs in and out' do
  let(:user) { create(:user) }

  it 'with all required fields filled', :js do
    login_as(user)

    expect(page).to have_text 'Log out'
    click_link 'Log out'
    expect(page).to have_text 'Successfully logged out'
  end

  it 'with some required fields blank' do
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'

    expect(page).not_to have_text 'Successfully logged in'
    expect(page).to have_text "Password can't be blank"
  end
end
