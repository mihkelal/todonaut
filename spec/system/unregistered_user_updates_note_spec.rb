# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unregistered user updates note' do
  let(:public_note) { create(:note, :with_some_attributes, completed_at: nil) }
  let(:private_note) { create(:note, :with_some_attributes, user: create(:user), completed_at: nil) }
  let(:completed_note) { create(:note, :with_some_attributes, completed_at: Time.current) }

  it 'when note is public', :js do
    visit edit_note_path(public_note)
    fill_in_rich_text_area with: 'New description'
    click_on 'Update Note'

    expect(page).to have_text 'Note successfully updated'
    expect(page).to have_text 'New description'
  end

  it 'when note is not public' do
    visit edit_note_path(private_note)

    expect(page).to have_text 'Note not found'
  end

  it 'when note is completed' do
    visit edit_note_path(completed_note)

    expect(page).to have_text 'Note already completed'
  end
end
