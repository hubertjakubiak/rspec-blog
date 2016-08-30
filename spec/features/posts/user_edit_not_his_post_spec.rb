  require 'rails_helper'

RSpec.feature "User edit post", :type => :feature do
    
    let!(:post) {FactoryGirl.create(:post, user_id: 2)}
    
    background do
      sign_in
    end
    
    scenario "with valid input" do
        
      visit "/posts/1"
      click_link "Edit"
  
      fill_in "Title", :with => "Title Post 2"
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
  
      expect(page).to have_text("This post does not belong to you.")
    end
    
    scenario "with no title" do
        
      visit "/posts/1/edit"
  
      fill_in "Title", :with => ""
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
  
      expect(page).to have_text("This post does not belong to you.")
      
    end
end