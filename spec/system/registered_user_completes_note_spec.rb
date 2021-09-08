# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user completes note' do
  let(:user) { create(:user) }
  let(:note) { create(:note, :with_some_attributes, user: user, completed_at: nil) }

  it 'when note belongs to user', :js do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Successfully logged in'

    visit note_path(note)
    click_link 'Mark as completed'

    expect(page).to have_text 'Note successfully marked as completed'
  end
end
