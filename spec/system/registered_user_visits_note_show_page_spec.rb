# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user visits note show page' do
  let(:user) { create(:user) }
  let(:users_note) { create(:note, :with_some_attributes, user:) }
  let(:other_note) { create(:note, :with_some_attributes, user: create(:user)) }

  before { login_as(user) }

  it 'when note belongs to user' do
    visit note_path(users_note)
    expect(page).to have_text users_note.title
  end

  it 'when note does not belong to user' do
    visit note_path(other_note)
    expect(page).to have_text 'Note not found'
    expect(page).to have_no_text other_note.title
  end
end
