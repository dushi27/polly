require 'spec_helper'
# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
# RSpec. 'Sign out', :devise do
RSpec.feature "Sign out" do

  # Scenario: User signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'user signs out successfully' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
    # click_link 'Sign Out'
    find(:xpath, '/html/body/nav/div/ul/li[3]/a').click
    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end

end


