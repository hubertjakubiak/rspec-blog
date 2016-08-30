  require 'rails_helper'

RSpec.feature "Visitor try to create new post", :type => :feature do
    
    scenario "no sign_in user" do
        
      visit root_path
      click_link "New Post"
      expect(page).to have_current_path(new_user_session_path)
    end
    
    scenario "no sign_in user" do
      sign_in
      visit root_path
      click_link "New Post"
      expect(page).to have_selector(:link_or_button, 'Save')
    end
    
end