# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user visits notes index page' do
  let(:user) { create(:user) }
  let!(:users_note) { create(:note, :with_some_attributes, user: user) }
  let!(:public_user) { create(:note, :with_some_attributes) }

  before do
    driven_by(:rack_test)
  end

  it 'seeing only his own notes' do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_no_text public_user.title
    expect(page).to have_text users_note.title
  end
end
