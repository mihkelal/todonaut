# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user completes note' do
  let(:user) { create(:user) }
  let(:note) { create(:note, :with_some_attributes, user:, completed_at: nil) }

  before { login_as(user) }

  it 'when note belongs to user' do
    visit note_path(note)
    click_on 'Mark as completed'

    expect(page).to have_text 'Note successfully marked as completed'
  end
end
