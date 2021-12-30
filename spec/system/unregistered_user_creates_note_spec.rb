# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unregistered user creates note' do
  let(:note) { attributes_for(:note, :with_some_attributes) }

  it 'with all fields filled', :js do
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
