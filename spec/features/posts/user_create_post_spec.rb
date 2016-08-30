  require 'rails_helper'

RSpec.feature "User create post", :type => :feature do
    
    let! (:post) {FactoryGirl.create_list(:post, 10) }
    
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
      
      expect(page).to have_text("can't be blank")
    end
    
    scenario "with missing title" do
  
      fill_in "Content", :with => "Content Post"
  
      click_button "Save"
      
      expect(page).to have_text("can't be blank")
    end
    
    scenario "with empty post" do
  
      click_button "Save"
      
      expect(page).to have_text("can't be blank")
    end
    
    scenario "from main page" do
      visit root_path
      click_link "New Post"
  
      click_button "Save"
      
      page_should_contain_error_about_cant_be_blank
    end
    
    scenario "after logout and fails" do
      logout
      visit root_path
      click_new_post_link
      
      expect(page).to have_text("You need to")
    end
    
    scenario "there should be 10 posts" do
      expect(Post.count).to eq(10)
    end
    
    def click_new_post_link
      click_link "New Post"
    end
    
    def page_should_contain_error_about_cant_be_blank
      expect(page).to have_text("can't be blank")
    end
end