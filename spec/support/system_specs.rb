# frozen_string_literal: true

module AuthenticationHelpers
  def login_as(user)
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Successfully logged in'
  end
end

RSpec.configure do |config|
  config.include(AuthenticationHelpers, type: :system)

  config.before(:each, type: :system) do
    driven_by(:rack_test)
  end

  config.before(:each, :js, type: :system) do
    driven_by(:selenium_chrome_headless)
  end
end
