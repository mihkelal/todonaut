# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user updates note' do
  let(:user) { create(:user) }
  let(:note) { create(:note, :with_some_attributes, user: user, completed_at: nil) }
  let(:other_note) { create(:note, :with_some_attributes, user: create(:user), completed_at: nil) }
  let(:completed_note) { create(:note, :with_some_attributes, user: user, completed_at: Time.current) }

  before do
    driven_by(:rack_test)
  end

  it 'when note blongs to user' do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Successfully logged in'

    visit edit_note_path(note)
    fill_in 'Description', with: 'New description'
    click_button 'Update Note'

    expect(page).to have_text 'Note successfully updated.'
    expect(page).to have_text 'New description'
  end

  it 'when note does not belong to user' do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Successfully logged in'

    visit edit_note_path(other_note)

    expect(page).to have_text 'You are not authorized to perform this action'
  end

  it 'when note is completed' do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Successfully logged in'

    visit edit_note_path(completed_note)

    expect(page).to have_text 'You are not authorized to perform this action'
  end
end
