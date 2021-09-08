# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user visits note show page' do
  let(:user) { create(:user) }
  let(:users_note) { create(:note, :with_some_attributes, user: user) }
  let(:other_note) { create(:note, :with_some_attributes, user: create(:user)) }

  it 'when note belongs to user' do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Successfully logged in'

    visit note_path(users_note)
    expect(page).to have_text users_note.title
  end

  it 'when note does not blong to user' do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Successfully logged in'

    visit note_path(other_note)
    expect(page).to have_text 'You are not authorized to perform this action'
    expect(page).to have_no_text other_note.title
  end
end
