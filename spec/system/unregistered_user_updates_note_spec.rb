# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unregistered user updates note' do
  let(:public_note) { create(:note, :with_some_attributes, completed_at: nil) }
  let(:private_note) { create(:note, :with_some_attributes, user: create(:user), completed_at: nil) }
  let(:completed_note) { create(:note, :with_some_attributes, completed_at: Time.current) }

  before do
    driven_by(:rack_test)
  end

  it 'when note is public' do
    visit edit_note_path(public_note)
    fill_in 'Description', with: 'New description'
    click_on 'Update Note'

    expect(page).to have_text 'Note successfully updated.'
    expect(page).to have_text 'New description'
  end

  it 'when note is not public' do
    visit edit_note_path(private_note)

    expect(page).to have_text 'You are not authorized to perform this action'
  end

  it 'when note is completed' do
    visit edit_note_path(completed_note)

    expect(page).to have_text 'You are not authorized to perform this action'
  end
end
