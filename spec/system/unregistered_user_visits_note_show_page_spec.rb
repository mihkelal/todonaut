# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unregistered user visits note show page' do
  let(:user) { create(:user) }
  let(:public_note) { create(:note, :with_some_attributes) }
  let(:private_note) { create(:note, :with_some_attributes, user: user) }

  it 'when note is public' do
    visit note_path(public_note)
    expect(page).to have_text public_note.title
  end

  it 'when note is private' do
    visit note_path(private_note)
    expect(page).to have_text 'You are not authorized to perform this action'
    expect(page).to have_no_text private_note.title
  end
end
