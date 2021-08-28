# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User registers' do
  before do
    driven_by(:rack_test)
  end

  it 'with all required fields filled' do
    visit register_path
    fill_in 'Username', with: Faker::Internet.username
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Register'

    expect(page).to have_text 'Successfully registered'
  end

  it 'with some required fields blank' do
    visit register_path
    fill_in 'Username', with: Faker::Internet.username
    fill_in 'Password', with: 'password'
    click_button 'Register'

    expect(page).to have_no_text 'Successfully registered'
    expect(page).to have_text "Password confirmation can't be blank"
  end
end
