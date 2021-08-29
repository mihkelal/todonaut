# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unregistered user visits notes index page' do
  let(:user) { create(:user) }
  let!(:users_note) { create(:note, :with_some_attributes, user: user) }
  let!(:public_note) { create(:note, :with_some_attributes) }

  before do
    driven_by(:rack_test)
  end

  it 'seeing only public notes' do
    visit notes_path

    expect(page).to have_no_text users_note.title
    expect(page).to have_text public_note.title
  end
end
