# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user creates note' do
  let(:user) { create(:user) }
  let(:note) { attributes_for(:note, :with_some_attributes) }

  before do
    driven_by(:rack_test)
  end

  it 'with all fields filled' do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Successfully logged in'

    visit new_note_path
    fill_in 'Title', with: note[:title]
    fill_in 'Description', with: note[:description]
    fill_in 'Started at', with: note[:started_at]
    fill_in 'Ended at', with: note[:completed_at]
    attach_file 'Files', 'spec/fixtures/text_file.txt'
    click_button 'Create Note'

    expect(page).to have_text 'Note successfully created'
    expect(page).to have_text note[:title]
  end
end
