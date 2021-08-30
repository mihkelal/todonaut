# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unregistered user completes note' do
  let(:note) { create(:note, :with_some_attributes, completed_at: nil) }

  before do
    driven_by(:selenium_chrome_headless)
  end

  it 'when note is public' do
    visit note_path(note)
    click_link 'Mark as completed'

    expect(page).to have_text 'Note successfully marked as completed'
  end
end
