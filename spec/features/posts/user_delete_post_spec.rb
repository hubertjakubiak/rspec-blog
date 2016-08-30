  require 'rails_helper'

RSpec.feature "User delete post", :type => :feature do
    
    let!(:post) { FactoryGirl.create(:post) }
    let!(:another_post) { FactoryGirl.create(:post, user_id: 2) }
    scenario "when user is logged in" do
        
      visit root_path
      first(:link, "Destroy").click
      expect(page).to have_content("You need to sign")
    end
    
    scenario "when user is logged out" do
      sign_in
      visit root_path
      first(:link, "Destroy").click
      expect(page).to have_content("Post was")
    end
    
    scenario "when user owns post" do
      sign_in
      visit root_path
      first(:link, "Destroy").click
      expect(page).to have_content("Post was")
    end
    
    scenario "when user does not own post" do
      sign_in
      visit root_path
      find(:xpath, "(//a[text()='Destroy'])[2]").click
      expect(page).to have_content("This post does not belong to you.")
    end
    
end