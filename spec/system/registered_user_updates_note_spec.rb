# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user updates note' do
  let(:user) { create(:user) }
  let(:note) { create(:note, :with_some_attributes, user:, completed_at: nil) }
  let(:other_note) { create(:note, :with_some_attributes, user: create(:user), completed_at: nil) }
  let(:completed_note) { create(:note, :with_some_attributes, user:, completed_at: Time.current) }

  before { login_as(user) }

  it 'when note belongs to user', :js do
    visit edit_note_path(note)
    fill_in_rich_text_area with: 'New description'

    click_on 'Update Note'

    expect(page).to have_text 'Note successfully updated'
    expect(page).to have_text 'New description'
  end

  it 'when note does not belong to user' do
    visit edit_note_path(other_note)

    expect(page).to have_text 'You are not authorized to perform this action'
  end

  it 'when note is completed' do
    visit edit_note_path(completed_note)

    expect(page).to have_text 'You are not authorized to perform this action'
  end
end
