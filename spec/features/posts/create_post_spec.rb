  require 'rails_helper'

RSpec.feature "Post", :type => :feature do
  describe "Create a new post" do
    background do
      sign_in
      visit "/posts/new"
    end
    
    scenario "with valid input" do
  
      fill_in "Title", :with => "Title Post"
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
      
      expect(page).to have_text("Title Post")
      expect(Post.last.user_id).not_to be_nil 
    end
    
    scenario "with missing content" do
  
      fill_in "Title", :with => "Title Post"
  
      click_button "Save"
      
      expect(page).to have_text("Content can't be blank")
    end
    
    scenario "with missing title" do
  
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
      
      expect(page).to have_text("Title can't be blank")
    end
    
    scenario "with empty post" do
  
      click_button "Save"
      
      expect(page).to have_text("Title can't be blank")
      expect(page).to have_text("Content can't be blank")
    end
    
    scenario "from main page" do
      visit root_path
      click_link "New Post"
  
      click_button "Save"
      
      expect(page).to have_text("Title can't be blank")
      expect(page).to have_text("Content can't be blank")
    end
    
    scenario "only user can access new post path" do
      logout
      visit root_path
      click_link "New Post"
      
      expect(page).to have_text("You need to")
    end
  end
end