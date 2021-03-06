  require 'rails_helper'

RSpec.feature "User edit post", :type => :feature do
    
    let!(:post) {FactoryGirl.create :post}
    
    background do
      sign_in
    end
    
    scenario "with valid input" do
        
      visit "/posts/1"
      click_link "Edit"
  
      fill_in "Title", :with => "Title Post 2"
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
  
      expect(page).to have_text("Title Post")
    end
    
    scenario "with no title" do
        
      visit "/posts/1/edit"
  
      fill_in "Title", :with => ""
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
  
      expect(page).to have_text("can't be blank")
      
    end
end