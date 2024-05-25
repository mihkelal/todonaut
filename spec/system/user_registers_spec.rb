# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User registers' do
  it 'with all required fields filled' do
    visit register_path
    fill_in 'Username', with: Faker::Internet.username
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    within('main') do
      click_on 'Register'
    end

    expect(page).to have_text 'Successfully registered'
  end

  it 'with some required fields blank' do
    visit register_path
    fill_in 'Username', with: Faker::Internet.username
    fill_in 'Password', with: 'password'
    within('main') do
      click_on 'Register'
    end

    expect(page).to have_no_text 'Successfully registered'
    expect(page).to have_text "Password confirmation can't be blank"
  end
end
