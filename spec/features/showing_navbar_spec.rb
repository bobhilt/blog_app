require "rails_helper"

RSpec.feature "Navbar links context-sensitive" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
  end
  
  scenario "A signed-in user does not see sign-in or sign-up links." do
    login_as(@john)
    visit "/"
    
    expect(page).to have_link("Sign out")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
    
  end
  
  scenario "A non-signed-in user does not see sign-out or Signed In As controls." do
    visit "/"
    
    expect(page).to have_link("Sign in")
    expect(page).to have_link("Sign up")
    expect(page).not_to have_link("Sign out")
    
  end
end