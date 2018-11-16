require 'rails_helper'

RSpec.feature "Visiting the home page", type: :feature do
  scenario "The visitor should see a welcome message" do
    visit root_path
    expect(page).to have_text("News articles")
  end 
end
