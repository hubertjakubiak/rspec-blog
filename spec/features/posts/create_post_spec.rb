  require 'rails_helper'

RSpec.feature "Post", :type => :feature do
  describe "Create a new post" do
    scenario "with valid input" do
      visit "/posts/new"
  
      fill_in "Title", :with => "Title Post"
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
  
      expect(page).to have_text("Title Post")
    end
    
    scenario "with missing content" do
      visit "/posts/new"
  
      fill_in "Title", :with => "Title Post"
  
      click_button "Save"
      
      expect(page).to have_text("Content can't be blank")
    end
    
    scenario "with missing title" do
      visit "/posts/new"
  
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
      
      expect(page).to have_text("Title can't be blank")
    end
    
    scenario "with empty post" do
      visit "/posts/new"
  
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
  end
end