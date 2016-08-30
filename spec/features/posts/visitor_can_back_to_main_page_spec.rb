  require 'rails_helper'

RSpec.feature "Visitor can back to main page", :type => :feature do
    
    let!(:post) {FactoryGirl.create :post}
    
    subject { page }
    
    scenario "no sign_in user" do
        
      visit root_path
      click_link "Show"
      click_link "Back"
      expect(page).to have_current_path(posts_path)
    end
    
    scenario "sign_in user" do
      sign_in 
      visit root_path
      click_link "Show"
      click_link "Back"
      expect(page).to have_current_path(posts_path)
    end
end