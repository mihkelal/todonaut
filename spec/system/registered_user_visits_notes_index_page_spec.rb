# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registered user visits notes index page' do
  let(:user) { create(:user) }
  let!(:users_note) { create(:note, :with_some_attributes, user: user) }
  let!(:public_note) { create(:note, :with_some_attributes) }

  before { login_as(user) }

  it 'seeing only his own notes' do
    expect(page).to have_no_text public_note.title
    expect(page).to have_text users_note.title
  end
end
