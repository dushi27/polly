require 'spec_helper'
# Feature: Sign inconf
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'short code link' do

  # Scenario: User cannot sign in if not registered
  #   Given I do not exist as a user
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  scenario 'cannot visit invalid short_code' do
    visit("/abcd")
    expect(page).to have_content 'Invalid question url'
  end

  scenario 'can visit invalid short_code' do
  	question = FactoryGirl.create(:question)
    visit("/abcd")
    expect(page).to have_content question.text
  end
end